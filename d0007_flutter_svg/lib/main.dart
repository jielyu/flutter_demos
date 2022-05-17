/**
 * 
 *  SVG清理工具： https://github.com/RazrFalcon/svgcleaner
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SVG Demo',
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
  double _dimension = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter SVG Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              min: 5.0,
              max: MediaQuery.of(context).size.width - 10.0,
              value: _dimension,
              onChanged: (double val) {
                setState(() => _dimension = val);
              },
            ),
            Container(
              color: Colors.grey,
              child: SvgPicture.asset(
                "assets/svg/test.svg",
                width: _dimension,
                // color: Colors.blue,
              ),
            ),
            const Text("原始图"),
            Container(
              color: Colors.grey,
              child: SvgPicture.asset(
                "assets/svg/test-ai.svg",
                width: _dimension,
                // color: Colors.blue,
              ),
            ),
            const Text("AI裁剪图"),
            Container(
              color: Colors.grey,
              child: SvgPicture.asset(
                "assets/svg/test-clean.svg",
                width: _dimension,
                // color: Colors.blue,
              ),
            ),
            const Text("工具清理图"),
            Container(
              color: Colors.grey,
              child: SvgPicture.asset(
                "assets/svg/test-clean.svg",
                width: _dimension,
                color: Colors.blue,
              ),
            ),
            const Text("颜色覆盖图"),
          ],
        ),
      ),
    );
  }
}
