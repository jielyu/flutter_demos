import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:d0011_libtorch/native_libtorch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Native LibTorch Example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isProcessed = false;
  bool _isWorking = false;
  String? result_img_path;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showVersion() {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final snackbar = SnackBar(
      content: Text('LibTorch version: ${opencvVersion()}'),
    );

    scaffoldMessenger
      ..removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
      ..showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native LibTorch Example')),
      body: Stack(
        children: <Widget>[
          Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                if (_isProcessed && !_isWorking && result_img_path != null)
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 3000, maxHeight: 300),
                    child: Image.file(
                      File(result_img_path!),
                      alignment: Alignment.center,
                    ),
                  ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: showVersion,
                      child: const Text('显示版本'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: const Text('处理图像'),
                      // onPressed: takeImageAndProcess,
                      onPressed: () async {
                        String? selectedDirectory = await FilePicker.platform
                            .getDirectoryPath(
                                dialogTitle: "请选择example/assets目录",
                                lockParentWindow: false,
                                initialDirectory: "/Users");

                        () async {
                          if (selectedDirectory != null) {
                            if (File(
                                    '$selectedDirectory/models/photo_sketch.pt')
                                .existsSync()) {
                              await compute(processImage,
                                  ProcessImageArguments(selectedDirectory, ""));
                              // 第二种多线程实现方式

                              // final port = ReceivePort();
                              // final args = ProcessImageArguments(
                              //     "/Users/jielyu/CodeStudio/flutter/flutter_demos/d0011_libtorch/example/assets",
                              //     "");

                              // // Spawning an isolate
                              // Isolate.spawn<ProcessImageArguments>(
                              //   processImage,
                              //   args,
                              //   onError: port.sendPort,
                              //   onExit: port.sendPort,
                              // );

                              // // Making a variable to store a subscription in
                              // late StreamSubscription sub;

                              // // Listening for messages on port
                              // sub = port.listen((_) async {
                              //   print("收到函数执行完毕的消息");
                              //   // Cancel a subscription after message received called
                              //   await sub.cancel();
                              //   print("测试运行完毕");
                              // });

                            } else {
                              print(selectedDirectory);
                              print('选择的目录错误，请选择example/assets目录');
                            }
                          }
                          print("测试运行完毕");
                        }()
                            .then((value) {
                          // 更新显示运算完成
                          setState(() {
                            _isProcessed = true;
                            _isWorking = false;
                            result_img_path = '$selectedDirectory/sketch.jpg';
                          });
                        });
                        // 更新显示加载运算中
                        setState(() {
                          _isWorking = true;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          if (_isWorking)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(.7),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
