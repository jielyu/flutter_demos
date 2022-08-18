import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'd0009_ffi_method_channel.dart';

abstract class D0009FfiPlatform extends PlatformInterface {
  /// Constructs a D0009FfiPlatform.
  D0009FfiPlatform() : super(token: _token);

  static final Object _token = Object();

  static D0009FfiPlatform _instance = MethodChannelD0009Ffi();

  /// The default instance of [D0009FfiPlatform] to use.
  ///
  /// Defaults to [MethodChannelD0009Ffi].
  static D0009FfiPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [D0009FfiPlatform] when
  /// they register themselves.
  static set instance(D0009FfiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
