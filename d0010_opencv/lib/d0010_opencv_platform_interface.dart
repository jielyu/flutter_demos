import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'd0010_opencv_method_channel.dart';

abstract class D0010OpencvPlatform extends PlatformInterface {
  /// Constructs a D0010OpencvPlatform.
  D0010OpencvPlatform() : super(token: _token);

  static final Object _token = Object();

  static D0010OpencvPlatform _instance = MethodChannelD0010Opencv();

  /// The default instance of [D0010OpencvPlatform] to use.
  ///
  /// Defaults to [MethodChannelD0010Opencv].
  static D0010OpencvPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [D0010OpencvPlatform] when
  /// they register themselves.
  static set instance(D0010OpencvPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
