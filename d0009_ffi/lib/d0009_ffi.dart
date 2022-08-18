
import 'd0009_ffi_platform_interface.dart';

class D0009Ffi {
  Future<String?> getPlatformVersion() {
    return D0009FfiPlatform.instance.getPlatformVersion();
  }
}
