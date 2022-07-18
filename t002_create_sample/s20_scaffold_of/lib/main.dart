import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for Scaffold.of.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: const MyScaffoldBody(),
        appBar: AppBar(title: const Text('Scaffold.of Example')),
      ),
      color: Colors.white,
    );
  }
}

class MyScaffoldBody extends StatelessWidget {
  const MyScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('SHOW BOTTOM SHEET'),
        onPressed: () {
          Scaffold.of(context).showBottomSheet<void>(
            (BuildContext context) {
              return Container(
                alignment: Alignment.center,
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
