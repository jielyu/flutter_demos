import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //  第二种设置方法
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // background (button) color
            onPrimary: Colors.white, // foreground (text) color
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('按钮样式'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          // 第一种设置方法
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // background (button) color
            onPrimary: Colors.green, // foreground (text) color
          ),
          onPressed: () => print('pressed'),
          child: const Text('Add to Cart'),
        ),
      ),
    );
  }
}
