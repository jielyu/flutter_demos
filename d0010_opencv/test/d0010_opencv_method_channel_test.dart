import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:d0010_opencv/d0010_opencv_method_channel.dart';

void main() {
  MethodChannelD0010Opencv platform = MethodChannelD0010Opencv();
  const MethodChannel channel = MethodChannel('d0010_opencv');

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
