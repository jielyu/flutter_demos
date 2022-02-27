import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("stack"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const StackEffectPage();
                }));
              },
              child: const Text("层叠效果"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const StackDemoPage();
                }));
              },
              child: const Text("长按显示"),
            ),
          ],
        ),
      ),
    );
  }
}

class StackEffectPage extends StatefulWidget {
  const StackEffectPage({Key? key}) : super(key: key);

  @override
  _StackEffectPageState createState() => _StackEffectPageState();
}

class _StackEffectPageState extends State<StackEffectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("层叠效果"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class StackDemoPage extends StatefulWidget {
  const StackDemoPage({Key? key}) : super(key: key);

  @override
  _StackDemoPageState createState() => _StackDemoPageState();
}

class _StackDemoPageState extends State<StackDemoPage> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("长按显示"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            child: const ListTile(
              leading: Icon(Icons.house),
              title: Text("商品"),
              subtitle: Text("关于当前商品的描述信息"),
              trailing: Icon(Icons.add_chart),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            // color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(
                        side: BorderSide(width: 0.1),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "删除",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(
                        side: BorderSide(width: 0.1),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "复制",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(
                        side: BorderSide(width: 0.1),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "投诉",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Opacity(
                opacity: _opacity,
                child: Container(
                  color: Colors.grey,
                  child: ListTile(
                    leading: const Icon(Icons.house),
                    title: const Text("商品"),
                    subtitle: const Text("关于当前商品的描述信息"),
                    trailing: const Icon(Icons.add_chart),
                    onLongPress: () {
                      setState(() {
                        _opacity = 0.3;
                      });
                    },
                  ),
                ),
              ),
              Visibility(
                visible: _opacity < 0.5,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  // color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink),
                          shape: MaterialStateProperty.all(
                            const CircleBorder(
                              side: BorderSide(width: 0.1),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("点击删除");
                          setState(() {
                            _opacity = 1.0;
                          });
                        },
                        child: const Text(
                          "删除",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all(
                            const CircleBorder(
                              side: BorderSide(width: 0.1),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("点击复制");
                          setState(() {
                            _opacity = 1.0;
                          });
                        },
                        child: const Text(
                          "复制",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                            const CircleBorder(
                              side: BorderSide(width: 0.1),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("点击投诉");
                          setState(() {
                            _opacity = 1.0;
                          });
                        },
                        child: const Text(
                          "投诉",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
