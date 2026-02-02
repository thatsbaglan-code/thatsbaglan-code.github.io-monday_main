
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:path/path.dart' as path;
import '../../models/types.dart';
import 'file_system_service_interface.dart';

class FileSystemService implements IFileSystemService {
  final Directory rootDir;

  FileSystemService(this.rootDir);
  
  // Factory to create from string path (avoiding Directory in UI)
  factory FileSystemService.fromPath(String path) {
    return FileSystemService(Directory(path));
  }

  @override
  String get currentPath => rootDir.path;

  @override
  Future<List<String>> listJsonFiles() async {
    final List<FileSystemEntity> entities = await rootDir.list().toList();
    return entities
        .whereType<File>()
        .where((file) => path.extension(file.path).toLowerCase() == '.json')
        .map((file) => path.basename(file.path))
        .toList()
      ..sort();
  }

  @override
  Future<List<Question>> getFileContent(String filename) async {
    final file = File(path.join(rootDir.path, filename));
    if (!await file.exists()) {
      throw FileSystemException('File not found', file.path);
    }
    final content = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(content);
    return jsonList.map((json) => Question.fromJson(json)).toList();
  }

  @override
  Future<void> saveFile(String filename, List<Question> questions) async {
    final file = File(path.join(rootDir.path, filename));
    final jsonList = questions.map((q) => q.toJson()).toList();
    final encoder = JsonEncoder.withIndent('  ');
    await file.writeAsString(encoder.convert(jsonList));
  }

  @override
  Future<String> saveImage(String filename, dynamic imageFile) async {
    File? fileToSave;
    
    if (imageFile is File) {
      fileToSave = imageFile;
    } else if (imageFile is XFile) {
      fileToSave = File(imageFile.path);
    } else {
       throw ArgumentError('imageFile must be a dart:io File or XFile on native');
    }
  
    final imagesDir = Directory(path.join(rootDir.path, 'images'));
    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }
    
    final targetPath = path.join(imagesDir.path, filename);
    await fileToSave!.copy(targetPath);
    
    return 'images/$filename';
  }

  @override
  Future<String?> getImageUrl(String relativePath) async {
      return path.join(rootDir.path, relativePath);
  }

  @override
  Future<Uint8List?> getImageBytes(String relativePath) async {
     final p = path.join(rootDir.path, relativePath);
     final f = File(p);
     if (await f.exists()) {
       return f.readAsBytes();
     }
     return null;
  }
}
