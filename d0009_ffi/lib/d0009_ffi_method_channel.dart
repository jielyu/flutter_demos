import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'd0009_ffi_platform_interface.dart';

/// An implementation of [D0009FfiPlatform] that uses method channels.
class MethodChannelD0009Ffi extends D0009FfiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('d0009_ffi');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
