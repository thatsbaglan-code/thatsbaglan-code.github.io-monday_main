
import 'dart:js_interop';
import 'package:flutter/widgets.dart';
import 'file_system/file_system_service_web.dart';
import 'file_system/file_system_service_interface.dart';
import '../utils/web_utils.dart';

Future<IFileSystemService?> pickDirectoryPlatform(BuildContext context) async {
  try {
     final handle = await showDirectoryPicker().toDart;
     return FileSystemService.fromHandle(handle);
  } catch (e) {
     print('Directory picker cancelled or failed: $e');
     return null;
  }
}
