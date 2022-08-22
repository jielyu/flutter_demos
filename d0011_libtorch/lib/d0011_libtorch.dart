
import 'd0011_libtorch_platform_interface.dart';

class D0011Libtorch {
  Future<String?> getPlatformVersion() {
    return D0011LibtorchPlatform.instance.getPlatformVersion();
  }
}
