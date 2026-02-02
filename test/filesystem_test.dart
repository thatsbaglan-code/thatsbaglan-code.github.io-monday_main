
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:monday_flutter/models/types.dart';
import 'package:monday_flutter/services/filesystem.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late FileSystemService fs;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('monday_test');
    fs = FileSystemService(tempDir);
  });

  tearDown(() async {
    await tempDir.delete(recursive: true);
  });

  test('listJsonFiles returns only json files', () async {
    await File(p.join(tempDir.path, 'test1.json')).create();
    await File(p.join(tempDir.path, 'test2.txt')).create();
    await File(p.join(tempDir.path, 'test3.JSON')).create(); // Case insensitive check

    final files = await fs.listJsonFiles();
    expect(files, containsAll(['test1.json', 'test3.JSON']));
    expect(files, isNot(contains('test2.txt')));
  });

  test('saveFile and getFileContent works', () async {
    final q = Question(
      QuestionID: '010101010001',
      QuestionNumber: 1,
      QuestionType: 'A',
      Chapter: '01',
      Topic: '01',
      Grade: '01',
      Level: '01',
      QuestionLatex: 'Content',
    );

    await fs.saveFile('questions.json', [q]);

    final loaded = await fs.getFileContent('questions.json');
    expect(loaded.length, 1);
    expect(loaded.first.QuestionID, '010101010001');
    expect(loaded.first.QuestionLatex, 'Content');
  });
}
