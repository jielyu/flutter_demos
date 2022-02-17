import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextPage extends StatefulWidget {
  const RichTextPage({Key? key}) : super(key: key);

  @override
  _RichTextPageState createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer();
    super.initState();
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("富文本"),
      ),
      body: Container(
        color: Colors.grey,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "#一个话题#",
                  style: const TextStyle(color: Colors.blue),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (context) {
                            return Container(
                              color: Colors.blue,
                              child: const Padding(
                                padding: EdgeInsets.all(32.0),
                                child: Text(
                                  '一个话题',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24.0),
                                ),
                              ),
                            );
                          });
                    }),
              const TextSpan(
                text:
                    "博客内容，博客内容，博客内容，博客内容，博客内容，博客内容，博客内容，博客内容，博客内容，博客内容，博客内容，博客内容，博客内容。",
                style: TextStyle(color: Colors.black),
              ),
              const TextSpan(
                text: "测试博文显示",
                style: TextStyle(color: Colors.pink),
              ),
              const WidgetSpan(
                child: Icon(Icons.person),
              ),
              const WidgetSpan(
                child: Icon(Icons.send),
              ),
              const WidgetSpan(
                child: Icon(Icons.camera),
              ),
              const WidgetSpan(
                child: Icon(Icons.airplane_ticket),
              ),
            ],
          ),
          maxLines: 5,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
