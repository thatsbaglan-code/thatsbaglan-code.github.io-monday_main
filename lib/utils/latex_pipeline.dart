
import 'package:flutter/foundation.dart';

enum LatexSegmentType { text, math }

@immutable
class LatexSegment {
  final LatexSegmentType type;
  final String value;

  const LatexSegment(this.type, this.value);

  @override
  String toString() => 'LatexSegment($type, "$value")';
}

/// Deterministic pipeline:
/// 1) Normalize JSON-safe input
/// 2) Segment into semantic blocks (text vs math)
/// 3) Math blocks are atomic (never split)
class LatexPipeline {
  const LatexPipeline();

  /// 1) Normalization: convert JSON-safe "/" to "\" and clean whitespace.
  ///
  /// IMPORTANT:
  /// - We only normalize once, at the beginning.
  /// - We do not try to "fix" LaTeX semantics beyond this.
  String normalize(String input) {
    final String trimmed = input.trim();

    // Convert JSON-safe slash to real backslash for LaTeX commands.
    // Example: /frac -> \frac
    final String backslashed = trimmed.replaceAll('/', r'\');

    // Normalize whitespace:
    // - collapse multiple spaces/tabs
    // - normalize newlines to single spaces (layout handled later)
    final String noNewlines = backslashed.replaceAll(RegExp(r'[\r\n]+'), ' ');
    final String collapsed = noNewlines.replaceAll(RegExp(r'[ \t\f\v]+'), ' ');

    return collapsed;
  }

  /// 2) Semantic segmentation into text + math blocks.
  ///
  /// Design goal:
  /// - Keep LaTeX command blocks intact (e.g., \frac{...}{...}, \sqrt{...})
  /// - Keep adjacent math-ish tokens together (e.g., "f(x)=\frac{...}{...}")
  ///
  /// NOTE:
  /// Because inputs may not have explicit delimiters ($...$),
  /// this uses a deterministic heuristic that is safe for school math text.
  List<LatexSegment> segment(String normalized) {
    if (normalized.isEmpty) return const <LatexSegment>[];

    final List<_Token> tokens = _tokenize(normalized);
    final List<_ClassifiedToken> classified = tokens
        .map((t) => _ClassifiedToken(t.raw, _classifyToken(t.raw)))
        .toList(growable: false);

    // Merge consecutive tokens of the same segment type into segments.
    final List<LatexSegment> out = <LatexSegment>[];

    LatexSegmentType? currentType;
    final StringBuffer buf = StringBuffer();

    void flush() {
      if (currentType == null) return;
      final String value = buf.toString();
      if (value.isNotEmpty) {
        out.add(LatexSegment(currentType!, value));
      }
      buf.clear();
      currentType = null;
    }

    for (final _ClassifiedToken ct in classified) {
      final LatexSegmentType segType =
          (ct.kind == _TokenKind.math) ? LatexSegmentType.math : LatexSegmentType.text;

      if (currentType == null) {
        currentType = segType;
        buf.write(ct.raw);
        continue;
      }

      if (segType == currentType) {
        buf.write(ct.raw);
      } else {
        flush();
        currentType = segType;
        buf.write(ct.raw);
      }
    }

    flush();

    // Cleanup: remove empty segments and trim only text edges, preserve math exactly.
    final List<LatexSegment> cleaned = <LatexSegment>[];
    for (final LatexSegment s in out) {
      if (s.type == LatexSegmentType.text) {
        final String v = s.value;
        if (v.trim().isEmpty) continue;
        cleaned.add(LatexSegment(LatexSegmentType.text, v));
      } else {
        final String v = s.value.trim();
        if (v.isEmpty) continue;
        cleaned.add(LatexSegment(LatexSegmentType.math, v));
      }
    }
    return cleaned;
  }

  // ---------------- Internals ----------------

  /// Tokenize into:
  /// - LaTeX command blocks starting with "\" (including balanced {...})
  /// - whitespace
  /// - other "runs" (words/punctuation)
  List<_Token> _tokenize(String s) {
    final List<_Token> out = <_Token>[];
    final int n = s.length;

    int i = 0;
    while (i < n) {
      final String ch = s[i];

      // Whitespace token (keep as-is; renderer will handle spacing safely)
      if (_isWhitespace(ch)) {
        final int start = i;
        while (i < n && _isWhitespace(s[i])) {
          i++;
        }
        out.add(_Token(s.substring(start, i)));
        continue;
      }

      // LaTeX command block: \command{...}{...} (balanced braces)
      if (ch == r'\') {
        final int start = i;
        i++; // consume '\'

        // command name: letters only (allow \, \%, etc. fall back)
        while (i < n && _isLetter(s[i])) {
          i++;
        }

        // Consume any immediate brace groups { ... } that follow,
        // including nested braces.
        while (i < n && s[i] == '{') {
          final int endGroup = _consumeBalancedBraces(s, i);
          if (endGroup <= i) break;
          i = endGroup;
        }

        // Also allow immediate bracket group [...] (common in some commands)
        while (i < n && s[i] == '[') {
          final int endGroup = _consumeBalancedBrackets(s, i);
          if (endGroup <= i) break;
          i = endGroup;
        }

        out.add(_Token(s.substring(start, i)));
        continue;
      }

      // Otherwise consume a run until whitespace or a backslash.
      final int start = i;
      while (i < n && !_isWhitespace(s[i]) && s[i] != r'\') {
        i++;
      }
      out.add(_Token(s.substring(start, i)));
    }

    return out;
  }

  int _consumeBalancedBraces(String s, int startIndex) {
    // startIndex must point to '{'
    if (startIndex < 0 || startIndex >= s.length) return startIndex;
    if (s[startIndex] != '{') return startIndex;

    int depth = 0;
    int i = startIndex;
    while (i < s.length) {
      final String ch = s[i];
      if (ch == '{') depth++;
      if (ch == '}') depth--;
      i++;
      if (depth == 0) {
        return i; // position AFTER the closing brace
      }
    }
    // If unbalanced, return original (do not consume)
    return startIndex;
  }

  int _consumeBalancedBrackets(String s, int startIndex) {
    if (startIndex < 0 || startIndex >= s.length) return startIndex;
    if (s[startIndex] != '[') return startIndex;

    int depth = 0;
    int i = startIndex;
    while (i < s.length) {
      final String ch = s[i];
      if (ch == '[') depth++;
      if (ch == ']') depth--;
      i++;
      if (depth == 0) {
        return i;
      }
    }
    return startIndex;
  }

  _TokenKind _classifyToken(String raw) {
    if (raw.isEmpty) return _TokenKind.text;

    // Whitespace token is text (spacing handled by renderer).
    if (raw.trim().isEmpty) return _TokenKind.text;

    // Strong math signal: LaTeX command present.
    if (raw.contains(r'\')) return _TokenKind.math;

    // Strong math signal: common math symbols anywhere in token.
    // (keeps math atomic; safe for school math)
    const String mathChars = '=<>^_±∓∞∈∉∪∩×·÷*/+-()[]{}|';
    for (int i = 0; i < raw.length; i++) {
      if (mathChars.contains(raw[i])) return _TokenKind.math;
    }

    // Medium math signal: contains digits mixed with x,y,z letters (e.g., 2x, x2, a1)
    final bool hasDigit = RegExp(r'\d').hasMatch(raw);
    final bool hasLatinVar = RegExp(r'[a-zA-Z]').hasMatch(raw);
    if (hasDigit && hasLatinVar) return _TokenKind.math;

    // Otherwise treat as plain text.
    return _TokenKind.text;
  }

  bool _isWhitespace(String ch) => ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r';
  bool _isLetter(String ch) => RegExp(r'[A-Za-z]').hasMatch(ch);
}

@immutable
class _Token {
  final String raw;
  const _Token(this.raw);
}

enum _TokenKind { text, math }

@immutable
class _ClassifiedToken {
  final String raw;
  final _TokenKind kind;
  const _ClassifiedToken(this.raw, this.kind);
}
