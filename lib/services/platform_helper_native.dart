import 'package:file_selector/file_selector.dart';
import 'package:flutter/widgets.dart';
import 'file_system/file_system_service.dart';
import 'file_system/file_system_service_interface.dart';

Future<IFileSystemService?> pickDirectoryPlatform(BuildContext context) async {
   final String? directoryPath = await getDirectoryPath();
   if (directoryPath != null) {
      return FileSystemService.fromPath(directoryPath);
   }
   return null;
}
