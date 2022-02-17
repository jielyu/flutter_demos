import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({Key? key}) : super(key: key);

  @override
  _AutoSizeTextPageState createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  late Timer _timer;
  final String content = "落霞与孤鹜齐飞，秋水共长天一色。渔舟唱晚，响穷彭蠡之滨，雁阵惊寒，声断衡阳之浦。";
  String _dispStr = "";
  int _length = 0;

  @override
  void initState() {
    // 设置定时器
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      _length += 1;
      var len = _length % content.length;
      if (len == 0) {
        ++len;
      }
      _dispStr = content.substring(0, len);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自动大小文本"),
      ),
      body: Container(
          color: Colors.grey,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  text: _dispStr,
                ),
                maxLines: 2,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black, fontSize: 50),
                overflow: TextOverflow.ellipsis,
                minFontSize: 14,
              ),
            ],
          )),
    );
  }
}
