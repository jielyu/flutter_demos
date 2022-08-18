import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:ffi/ffi.dart';

// C function signatures
typedef _CVersionFunc = ffi.Pointer<Utf8> Function();
typedef _CNativeAddFunc = ffi.Int Function(
  ffi.Int,
  ffi.Int,
);

// Dart function signatures
typedef _VersionFunc = ffi.Pointer<Utf8> Function();
typedef _NativeAddFunc = int Function(int, int);

// Getting a library that holds needed symbols
ffi.DynamicLibrary _openDynamicLibrary() {
  if (Platform.isAndroid) {
    return ffi.DynamicLibrary.open('libflutter_ffi_plugin.so');
  } else if (Platform.isWindows) {
    return ffi.DynamicLibrary.open("flutter_ffi_plugin_windows_plugin.dll");
  }

  return ffi.DynamicLibrary.process();
}

ffi.DynamicLibrary _lib = _openDynamicLibrary();

// Looking for the functions
final _VersionFunc _version =
    _lib.lookup<ffi.NativeFunction<_CVersionFunc>>('version').asFunction();
final _NativeAddFunc _nativeAdd =
    _lib.lookup<ffi.NativeFunction<_CNativeAddFunc>>('nativeAdd').asFunction();

String getVersion() {
  return _version().toDartString();
}

int nativeAdd(int a, int b) {
  return _nativeAdd(a, b);
}
