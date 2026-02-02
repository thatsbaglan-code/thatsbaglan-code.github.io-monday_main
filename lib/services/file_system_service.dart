
import 'file_system/file_system_service_interface.dart';
// Conditional imports
import 'file_system/file_system_service_native.dart' if (dart.library.html) 'file_system/file_system_service_web.dart';

// Export the interface
export 'file_system/file_system_service_interface.dart';

// The abstract service definition logic for external use
// Actually, we can just expose a factory or simply export the class if they have same name
// in conditional imports. The conditional import above imports '...native.dart' normally,
// but '...web.dart' if dart.library.html (Web) is present.
// Both files define class FileSystemService implements IFileSystemService.
// So importing this file gives the correct class.

export 'file_system/file_system_service_native.dart' if (dart.library.html) 'file_system/file_system_service_web.dart';
