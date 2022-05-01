import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:widget_to_image/widget_to_image.dart';

import 'package:d0006_gen_image/widget2image_demo.dart';

void main() {
  runApp(MyApp());
  // runApp(Widget2ImageMyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Widget To Image',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  ByteData? _byteData;
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: _callRepaintBoundaryToImage,
                  child: const Text('重绘到图片'),
                ),
                ElevatedButton(
                  onPressed: _callWidgetToImage,
                  child: const Text('组件转图片'),
                ),
                _byteData != null
                    ? Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Image.memory(_byteData!.buffer.asUint8List()),
                      )
                    : Container(),
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.purple,
                ),
                Container(
                  height: 100,
                  color: Colors.grey,
                ),
                Container(
                  height: 100,
                  color: Colors.orange,
                ),
                const Text("超出屏幕之外的部分"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _callRepaintBoundaryToImage() async {
    ByteData byteData = await WidgetToImage.repaintBoundaryToImage(_globalKey);
    setState(() => _byteData = byteData);
  }

  _callWidgetToImage() async {
    ByteData byteData = await WidgetToImage.widgetToImage(
      SingleChildScrollView(
        child: Container(
          width: 150,
          // height: 120,
          color: Colors.blue,
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text("文字"),
                ),
              ),
              Container(
                height: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                color: Colors.green,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                color: Colors.purple,
              ),
              Container(
                height: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                color: Colors.orange,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text("超出屏幕之外的部分"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    setState(() => _byteData = byteData);
  }
}
