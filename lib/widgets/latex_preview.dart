import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../utils/latex_pipeline.dart'; // Import the pipeline

class LatexPreview extends StatelessWidget {
  final String content;
  final TextStyle? style;

  const LatexPreview({super.key, required this.content, this.style});

  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) return const SizedBox.shrink();

    // Use deterministic pipeline
    const pipeline = LatexPipeline();
    final normalized = pipeline.normalize(content);
    final segments = pipeline.segment(normalized);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center, // Align baselines if possible, or center
      runSpacing: 4,
      spacing: 4,
      children: segments.map((seg) {
        if (seg.type == LatexSegmentType.text) {
          // Render regular text
          return Text(
            seg.value,
            style: style ?? const TextStyle(color: Colors.black, fontSize: 14),
          );
        } else {
          // Render Math
          try {
            return Math.tex(
              seg.value,
              textStyle: style,
              // Use textual math style for inline feel, or display if standalone.
              // Given the segmentation, it flows with text, so MathStyle.text is key.
              mathStyle: MathStyle.text, 
              onErrorFallback: (error) => Text(
                'Error: ${error.message}', // seg.value
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            );
          } catch (e) {
            return Text(
              seg.value, 
              style: (style ?? const TextStyle()).copyWith(color: Colors.red),
            );
          }
        }
      }).toList(),
    );
  }
}
