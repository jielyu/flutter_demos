import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MethodChannel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String? _batteryLevel;
  int _nativeAddResult = 0;

  Future<void> _getBatteryLevel() async {
    String? batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _computeNativeAddition(int a, int b) async {
    final Map<dynamic, dynamic> result =
        await platform.invokeMethod('computeNativeAddition', <String, dynamic>{
      'a': a,
      'b': b,
    });
    if (result.containsKey('c')) {
      setState(() {
        _nativeAddResult = result['c'];
      });
    }
    print('Native addition result: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("通道测试"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(_batteryLevel ?? 'Battery level unknown.'),
            ),
            ElevatedButton(
              onPressed: () {
                _getBatteryLevel();
                print("调用通道");
              },
              child: const Text("调用通道"),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(_nativeAddResult > 0
                  ? "native add result: $_nativeAddResult"
                  : "native add result: 0"),
            ),
            ElevatedButton(
                onPressed: () {
                  _computeNativeAddition(1, 2);
                },
                child: const Text("调用原生加法")),
          ],
        ),
      ),
    );
  }
}
