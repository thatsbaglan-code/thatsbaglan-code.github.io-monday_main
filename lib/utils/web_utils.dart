
import 'dart:js_interop';
import 'package:web/web.dart' as web;

/// JS Interop for File System Access API
/// https://developer.mozilla.org/en-US/docs/Web/API/File_System_Access_API

@JS()
external JSPromise<FileSystemDirectoryHandle> showDirectoryPicker([JSAny? options]);

@JS()
extension type FileSystemHandle._(JSObject _) implements JSObject {
  external String get name;
  external String get kind; // 'file' or 'directory'
  external JSPromise<JSBoolean> isSameEntry(FileSystemHandle other);
}

@JS()
extension type FileSystemDirectoryHandle._(JSObject _) implements FileSystemHandle {
    // getFileHandle(name, {create: true/false})
    external JSPromise<FileSystemFileHandle> getFileHandle(String name, [JSAny? options]);
    
    // getDirectoryHandle(name, {create: true/false})
    external JSPromise<FileSystemDirectoryHandle> getDirectoryHandle(String name, [JSAny? options]);
}

// Helper to iterate directory entries
@JS()
extension type FileSystemFileHandle._(JSObject _) implements FileSystemHandle {
  external JSPromise<web.File> getFile();
  external JSPromise<FileSystemWritableFileStream> createWritable([JSAny? options]);
}

@JS()
extension type FileSystemWritableFileStream._(JSObject _) implements JSObject {
  external JSPromise<JSAny?> write(JSAny? data);
  external JSPromise<JSAny?> close();
}

// Async Iterator handling
@JS()
extension type AsyncIterator._(JSObject _) implements JSObject {
  external JSPromise<IteratorResult> next();
}

@JS()
extension type IteratorResult._(JSObject _) implements JSObject {
  external JSAny? get value;
  external bool get done;
}

extension FileSystemDirectoryHandleExt on FileSystemDirectoryHandle {
  // Use values() to get handle iterator
  @JS('values')
  external AsyncIterator values();
}
