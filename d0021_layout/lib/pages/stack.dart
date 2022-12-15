import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StackLayoutDemo extends StatelessWidget {
  const StackLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 90,
            height: 90,
            color: Colors.green,
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

/*
SizedBox(
  width: 250,
  height: 250,
  child: Stack(
    children: <Widget>[
      Container(
        width: 250,
        height: 250,
        color: Colors.white,
      ),
      Container(
        padding: const EdgeInsets.all(5.0),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.black.withAlpha(0),
              Colors.black12,
              Colors.black45
            ],
          ),
        ),
        child: const Text(
          'Foreground Text',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    ],
  ),
)
*/