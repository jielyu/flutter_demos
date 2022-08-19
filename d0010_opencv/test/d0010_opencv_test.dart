import 'package:flutter_test/flutter_test.dart';
import 'package:d0010_opencv/d0010_opencv.dart';
import 'package:d0010_opencv/d0010_opencv_platform_interface.dart';
import 'package:d0010_opencv/d0010_opencv_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockD0010OpencvPlatform 
    with MockPlatformInterfaceMixin
    implements D0010OpencvPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final D0010OpencvPlatform initialPlatform = D0010OpencvPlatform.instance;

  test('$MethodChannelD0010Opencv is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelD0010Opencv>());
  });

  test('getPlatformVersion', () async {
    D0010Opencv d0010OpencvPlugin = D0010Opencv();
    MockD0010OpencvPlatform fakePlatform = MockD0010OpencvPlatform();
    D0010OpencvPlatform.instance = fakePlatform;
  
    expect(await d0010OpencvPlugin.getPlatformVersion(), '42');
  });
}
