
import 'd0010_opencv_platform_interface.dart';

class D0010Opencv {
  Future<String?> getPlatformVersion() {
    return D0010OpencvPlatform.instance.getPlatformVersion();
  }
}
