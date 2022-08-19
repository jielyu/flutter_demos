import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'd0010_opencv_platform_interface.dart';

/// An implementation of [D0010OpencvPlatform] that uses method channels.
class MethodChannelD0010Opencv extends D0010OpencvPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('d0010_opencv');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
