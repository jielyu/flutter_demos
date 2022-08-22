import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'd0011_libtorch_method_channel.dart';

abstract class D0011LibtorchPlatform extends PlatformInterface {
  /// Constructs a D0011LibtorchPlatform.
  D0011LibtorchPlatform() : super(token: _token);

  static final Object _token = Object();

  static D0011LibtorchPlatform _instance = MethodChannelD0011Libtorch();

  /// The default instance of [D0011LibtorchPlatform] to use.
  ///
  /// Defaults to [MethodChannelD0011Libtorch].
  static D0011LibtorchPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [D0011LibtorchPlatform] when
  /// they register themselves.
  static set instance(D0011LibtorchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
