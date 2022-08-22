import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:d0011_libtorch/d0011_libtorch_method_channel.dart';

void main() {
  MethodChannelD0011Libtorch platform = MethodChannelD0011Libtorch();
  const MethodChannel channel = MethodChannel('d0011_libtorch');

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
