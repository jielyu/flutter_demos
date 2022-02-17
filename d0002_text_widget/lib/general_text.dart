import 'dart:async';

import 'package:flutter/material.dart';

class GeneralTextPage extends StatefulWidget {
  const GeneralTextPage({Key? key}) : super(key: key);

  @override
  _GeneralTextPageState createState() => _GeneralTextPageState();
}

class _GeneralTextPageState extends State<GeneralTextPage> {
  late Timer _timer;
  final List<double?> _fontSizes = [12, 16, 20, 24, 30];
  final List<Color> _fontColors = [Colors.red, Colors.blue, Colors.green];
  final List<TextAlign> _textAlign = [
    TextAlign.start,
    TextAlign.end,
    TextAlign.left,
    TextAlign.right,
    TextAlign.center
  ];
  final List<double?> _letterSpaces = [1, 5, 10];
  final List<TextDirection> _textDirections = [
    TextDirection.ltr,
    TextDirection.rtl
  ];
  final List<int?> _maxLines = [1, 2, 3, 4];
  final List<TextOverflow> _overflows = [
    TextOverflow.clip,
    TextOverflow.ellipsis,
    TextOverflow.fade,
    TextOverflow.visible
  ];
  String _feature = "";
  String _featureTag = "";

  late double? _fontSize;
  late Color _fontColor;
  late double? _letterSpace;
  late TextDirection _textDirection;
  late int? _maxLine;
  late TextOverflow _overflow;
  int idx = 0;

  void _initParams() {
    _fontSize = _fontSizes[1];
    _fontColor = _fontColors[0];
    _letterSpace = _letterSpaces[0];
    _textDirection = _textDirections[0];
    _maxLine = 10;
    _overflow = _overflows[0];
  }

  @override
  void initState() {
    _initParams();
    // 设置定时器
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _initParams();
      idx += 1;
      if (_feature == "font_size") {
        _fontSize = _fontSizes[idx % _fontSizes.length];
        _featureTag = "fontSize:${_fontSize.toString()}";
      } else if (_feature == "font_color") {
        _fontColor = _fontColors[idx % _fontColors.length];
        _featureTag = "fontColor:${_fontColor.toString()}";
      } else if (_feature == "letter_space") {
        _letterSpace = _letterSpaces[idx % _letterSpaces.length];
        _featureTag = "letterSpacing:${_letterSpace.toString()}";
      } else if (_feature == "text_direction") {
        _textDirection = _textDirections[idx % _textDirections.length];
        _featureTag = "textDirection:${_textDirection.toString()}";
      } else if (_feature == "max_line") {
        _maxLine = _maxLines[idx % _maxLines.length];
        _featureTag = "maxLines:${_maxLine.toString()}";
      } else if (_feature == "overflow") {
        _maxLine = 3;
        _overflow = _overflows[idx % _overflows.length];
        _featureTag = "overflow:${_overflow.toString()}";
      }
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
        title: const Text("一般文本"),
      ),
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _featureTag,
              style: const TextStyle(color: Colors.yellow),
            ),
            _feature == ""
                ? Container()
                : ElevatedButton(
                    onPressed: () {
                      _feature = "";
                      _featureTag = "";
                    },
                    child: const Text("停止"),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _feature = "font_size";
                  },
                  child: const Text("大小"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _feature = "font_color";
                  },
                  child: const Text("颜色"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _feature = "letter_space";
                  },
                  child: const Text("间距"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _feature = "text_direction";
                  },
                  child: const Text("对齐"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _feature = "max_line";
                  },
                  child: const Text("行数"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _feature = "overflow";
                  },
                  child: const Text("溢出"),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              width: 200,
              child: Text(
                "落霞与孤鹜齐飞，秋水共长天一色。渔舟唱晚，响穷彭蠡之滨，雁阵惊寒，声断衡阳之浦。",
                style: TextStyle(
                    fontSize: _fontSize,
                    color: _fontColor,
                    letterSpacing: _letterSpace,
                    overflow: _overflow),
                textDirection: _textDirection,
                maxLines: _maxLine,
              ),
            )
          ],
        ),
      ),
    );
  }
}
