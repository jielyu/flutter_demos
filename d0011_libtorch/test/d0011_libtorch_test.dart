import 'package:flutter_test/flutter_test.dart';
import 'package:d0011_libtorch/d0011_libtorch.dart';
import 'package:d0011_libtorch/d0011_libtorch_platform_interface.dart';
import 'package:d0011_libtorch/d0011_libtorch_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockD0011LibtorchPlatform 
    with MockPlatformInterfaceMixin
    implements D0011LibtorchPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final D0011LibtorchPlatform initialPlatform = D0011LibtorchPlatform.instance;

  test('$MethodChannelD0011Libtorch is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelD0011Libtorch>());
  });

  test('getPlatformVersion', () async {
    D0011Libtorch d0011LibtorchPlugin = D0011Libtorch();
    MockD0011LibtorchPlatform fakePlatform = MockD0011LibtorchPlatform();
    D0011LibtorchPlatform.instance = fakePlatform;
  
    expect(await d0011LibtorchPlugin.getPlatformVersion(), '42');
  });
}
