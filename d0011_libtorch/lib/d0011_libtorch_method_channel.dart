import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'd0011_libtorch_platform_interface.dart';

/// An implementation of [D0011LibtorchPlatform] that uses method channels.
class MethodChannelD0011Libtorch extends D0011LibtorchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('d0011_libtorch');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
