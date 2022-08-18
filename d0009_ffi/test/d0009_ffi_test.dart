import 'package:flutter_test/flutter_test.dart';
import 'package:d0009_ffi/d0009_ffi.dart';
import 'package:d0009_ffi/d0009_ffi_platform_interface.dart';
import 'package:d0009_ffi/d0009_ffi_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockD0009FfiPlatform 
    with MockPlatformInterfaceMixin
    implements D0009FfiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final D0009FfiPlatform initialPlatform = D0009FfiPlatform.instance;

  test('$MethodChannelD0009Ffi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelD0009Ffi>());
  });

  test('getPlatformVersion', () async {
    D0009Ffi d0009FfiPlugin = D0009Ffi();
    MockD0009FfiPlatform fakePlatform = MockD0009FfiPlatform();
    D0009FfiPlatform.instance = fakePlatform;
  
    expect(await d0009FfiPlugin.getPlatformVersion(), '42');
  });
}
