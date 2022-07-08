import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pytorch Lite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('test_pytorch_lite/test');
  String pathImageModel = "assets/models/photo_sketch.ptl";

  Future<void> _testStart() async {
    final res = await platform.invokeMethod('testStart');
    print('testStart: $res');
  }

  Future<void> _loadModel() async {
    String absPath = await _getAbsolutePath(pathImageModel);
    try {
      print('start load model from absolute path: $absPath');
      final res = await platform
          .invokeMethod('loadModel', <String, dynamic>{'modelPath': absPath});
      print('load model res: $res');
    } catch (e) {
      print(e);
    }
  }

  static Future<String> _getAbsolutePath(String path) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dirPath = join(dir.path, path);
    ByteData data = await rootBundle.load(path);
    //copy asset to documents directory
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    //create non existant directories
    List split = path.split("/");
    String nextDir = "";
    for (int i = 0; i < split.length; i++) {
      if (i != split.length - 1) {
        nextDir += split[i];
        await Directory(join(dir.path, nextDir)).create();
        nextDir += "/";
      }
    }
    await File(dirPath).writeAsBytes(bytes);

    return dirPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pytorch Lite"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _testStart();
                },
                child: const Text("测试通道"),
              ),
              ElevatedButton(
                onPressed: () {
                  _loadModel();
                },
                child: const Text("载入lite模型"),
              ),
            ],
          )),
    );
  }
}
