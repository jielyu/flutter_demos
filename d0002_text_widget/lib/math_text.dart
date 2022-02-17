import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
// import 'package:flutter_tex/flutter_tex.dart';

class MathTextPage extends StatefulWidget {
  const MathTextPage({Key? key}) : super(key: key);

  @override
  _MathTextPageState createState() => _MathTextPageState();
}

class _MathTextPageState extends State<MathTextPage> {
  late Timer _timer;
  int _length = 0;
  final List<Widget> _widgets = [
    Math.tex(
      r'\frac {a} {b}',
      mathStyle: MathStyle.display,
      textStyle: const TextStyle(color: Colors.red, fontSize: 100),
    ),
    const SizedBox(
      height: 10,
    ),
    Math.tex(
      r'E=mc^2',
      mathStyle: MathStyle.display,
      textStyle: const TextStyle(color: Colors.blue, fontSize: 50),
    ),
    const SizedBox(
      height: 10,
    ),
    Math.tex(
      r'i\hbar\frac{\partial}{\partial t}\Psi(\vec x,t) = -\frac{\hbar}{2m}\nabla^2\Psi(\vec x,t)+ V(\vec x)\Psi(\vec x,t)',
      mathStyle: MathStyle.display,
      textStyle: const TextStyle(color: Colors.black),
    ),
    const SizedBox(
      height: 10,
    ),
    Math.tex(
      r'\hat f(\xi) = \int_{-\infty}^\infty f(x)e^{- 2\pi i \xi x}\mathrm{d}x',
      mathStyle: MathStyle.display,
      textStyle: const TextStyle(color: Colors.pink),
    ),
  ];

  @override
  void initState() {
    // 设置定时器
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      _length = (_length + 1) % _widgets.length;
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
        title: const Text("数学公式"),
      ),
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: Container(
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _length == _widgets.length
                ? _widgets
                : _widgets.sublist(0, _length + 1),
          ),
        ),
      ),
    );
  }
}
