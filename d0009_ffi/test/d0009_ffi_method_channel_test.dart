import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:d0009_ffi/d0009_ffi_method_channel.dart';

void main() {
  MethodChannelD0009Ffi platform = MethodChannelD0009Ffi();
  const MethodChannel channel = MethodChannel('d0009_ffi');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
