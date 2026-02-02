
import 'dart:convert';
import 'dart:js_interop';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web/web.dart' as web;
import '../../models/types.dart';
import '../../utils/web_utils.dart'; 
import 'file_system_service_interface.dart';

class FileSystemService implements IFileSystemService {
  final FileSystemDirectoryHandle? _handle;
  final String _rootName;
  
  // Memory fallback storage
  final Map<String, String> _memFiles = {};

  FileSystemService._(this._handle, this._rootName);

  /// Create a real browser-based file system service from a directory handle
  factory FileSystemService.fromHandle(FileSystemDirectoryHandle handle) {
    return FileSystemService._(handle, handle.name);
  }

  /// Create a memory-based service (fallback/demo)
  factory FileSystemService.fromPath(String path) {
    return FileSystemService._(null, path);
  }

  @override
  String get currentPath => _handle != null ? 'Folder: $_rootName' : 'Memory: $_rootName';

  @override
  Future<List<String>> listJsonFiles() async {
    if (_handle == null) {
      return _memFiles.keys.where((k) => k.endsWith('.json')).toList();
    }

    final files = <String>[];
    try {
      final iterator = _handle!.values();
      while (true) {
        final result = await iterator.next().toDart;
        if (result.done) break;
        
        // result.value is JSAny? need to cast to FileSystemHandle
        final entry = result.value as FileSystemHandle;
        if (entry.kind == 'file' && entry.name.endsWith('.json')) {
           files.add(entry.name);
        }
      }
    } catch (e) {
      print('Error listing files: $e');
    }
    return files;
  }

  @override
  Future<List<Question>> getFileContent(String filename) async {
    String content;
    
    if (_handle != null) {
      // Browser FS
      try {
        final fileHandle = await _handle!.getFileHandle(filename).toDart;
        final file = await fileHandle.getFile().toDart;
        // text() returns Promise<String> (JSString)
        content = (await file.text().toDart).toDart;
      } catch (e) {
        throw Exception('Failed to read file $filename: $e');
      }
    } else {
      // Memory
      content = _memFiles[filename] ?? '';
      if (content.isEmpty) throw Exception('File not found in memory: $filename');
    }

    final List<dynamic> jsonList = jsonDecode(content);
    return jsonList.map((e) => Question.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> saveFile(String filename, List<Question> questions) async {
    final jsonList = questions.map((q) => q.toJson()).toList();
    final content = jsonEncode(jsonList);

    if (_handle != null) {
      // Browser FS
      try {
        final fileHandle = await _handle!.getFileHandle(filename, _createOptions(true)).toDart;
        final writable = await fileHandle.createWritable().toDart;
        await writable.write(content.toJS).toDart;
        await writable.close().toDart;
        if (kDebugMode) print('Saved $filename to disk via File System Access API');
      } catch (e) {
        print('Error saving file to disk: $e');
        throw Exception('Failed to save to disk: $e');
      }
    } else {
      // Memory
      _memFiles[filename] = content;
      if (kDebugMode) print('Saved $filename to memory (size: ${content.length})');
    }
  }

  @override
  Future<String> saveImage(String filename, dynamic imageFile) async {
      // On Web, creating image files in the same directory
      if (_handle != null) {
          try {
             // We need bytes. 
             Uint8List bytes;
             if (imageFile is XFile) {
               bytes = await imageFile.readAsBytes();
             } else {
               // Fallback or error
               throw UnimplementedError('Unsupported image type: ${imageFile.runtimeType}');
             }

             // Check/Create 'images' folder
             final imagesDir = await _handle!.getDirectoryHandle('images', _createOptions(true)).toDart;
             
             final fileHandle = await imagesDir.getFileHandle(filename, _createOptions(true)).toDart;
             final writable = await fileHandle.createWritable().toDart;
             
             // Convert Uint8List to JSUint8Array
             await writable.write(bytes.toJS).toDart;
             await writable.close().toDart;
             
             return 'images/$filename';
          } catch (e) {
             print('Error saving image: $e');
             return 'Error';
          }
      }
      
      return 'images/$filename';
  }

  @override
  Future<String?> getImageUrl(String relativePath) async {
    return null; // Not using URLs, using bytes
  }
  
  @override
  Future<Uint8List?> getImageBytes(String relativePath) async {
    if (_handle != null) {
       try {
         final parts = relativePath.split('/');
         var currentDir = _handle!;
         
         // Navigate to folder
         for (var i=0; i<parts.length - 1; i++) {
            currentDir = await currentDir.getDirectoryHandle(parts[i]).toDart;
         }
         
         final fileName = parts.last;
         final fileHandle = await currentDir.getFileHandle(fileName).toDart;
         final file = await fileHandle.getFile().toDart;
         final buffer = await file.arrayBuffer().toDart;
         return buffer.toDart.asUint8List();
         
       } catch (e) {
         print('Error reading image bytes $relativePath: $e');
         return null;
       }
    }
    return null;
  }
  
  JSAny? _createOptions(bool create) {
    return {'create': create}.jsify();
  }
}
