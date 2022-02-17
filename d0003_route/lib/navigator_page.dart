import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late TextEditingController _nameTextEditController;
  late TextEditingController _msgTextEditController;
  @override
  void initState() {
    _nameTextEditController = TextEditingController();
    _msgTextEditController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditController.dispose();
    _msgTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator跳转"),
      ),
      body: Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  // flex: 1,
                  child: TextField(
                    controller: _nameTextEditController,
                    autofocus: false,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: const InputDecoration(
                        hintText: "请输入name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2))),
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  // flex: 1,
                  child: TextField(
                    controller: _msgTextEditController,
                    autofocus: false,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: const InputDecoration(
                        hintText: "请输入msg",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2))),
                    maxLines: 1,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                String name = _nameTextEditController.text;
                String msg = _msgTextEditController.text;
                if (name.isEmpty) {
                  name = "test";
                }
                if (msg.isEmpty) {
                  msg = "how are you";
                }
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DynamicRoutePage(name, msg),
                ));
              },
              child: const Text("动态路由跳转"),
            )
          ],
        ),
      ),
    );
  }
}

class DynamicRoutePage extends StatelessWidget {
  String name = "默认";
  String message = "空";
  DynamicRoutePage(this.name, this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动态路由"),
      ),
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Navigator.of(context).push()",
              style: TextStyle(color: Colors.red),
            ),
            Text("name:$name"),
            Text("message:$message")
          ],
        ),
      ),
    );
  }
}
