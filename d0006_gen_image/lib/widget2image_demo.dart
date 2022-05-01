import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget2image/widget2image.dart';

class Widget2ImageMyApp extends StatelessWidget {
  const Widget2ImageMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? _byteData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _byteData != null
              ? Container(
                  height: 300,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Image.memory(_byteData!),
                )
              : Container(
                  child: const Text("empty"),
                ),
          Widget2Image(
            format: ImageByteFormat.png,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Builder(
                    builder: (ctx) => ElevatedButton(
                      onPressed: () => _loadImage(ctx),
                      child: const Text('转换控件为图片'),
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
                  const Text("超出屏幕之外的部分"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loadImage(BuildContext context) async {
    var byteData = await Widget2Image.of(context).loadImage();
    setState(() {
      _byteData = byteData;
    });
    // 获取到图片字节数据 ---- 之后可随意操作
//    final dir = await getTemporaryDirectory();
//    final dest = path.join(dir.path, "widget.png");
//    await File(dest).writeAsBytes(bytes);
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text("图片已保存到:$dest")));
  }
}
