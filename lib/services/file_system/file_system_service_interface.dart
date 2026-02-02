
import '../../models/types.dart';
import 'dart:typed_data';

abstract class IFileSystemService {
  Future<List<String>> listJsonFiles();
  Future<List<Question>> getFileContent(String filename);
  Future<void> saveFile(String filename, List<Question> questions);
  
  // Handling images is platform specific in implementation details,
  // but the interface should accept a generic file-like object or bytes.
  // For simplicity, we'll use a dynamic or cross-platform File type if possible.
  // But since ImagePicker returns XFile, we can use that!
  Future<String> saveImage(String filename, dynamic imageFile); 
  
  // To show images
  Future<String?> getImageUrl(String relativePath);
  Future<Uint8List?> getImageBytes(String relativePath);
  
  // Path display
  String get currentPath;
}
