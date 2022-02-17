import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
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
        title: const Text("路由跳转"),
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
                  Navigator.pushNamed(context, "/static_route",
                      arguments: StaticRouteArgs(name, msg));
                },
                child: const Text("静态跳转"),
              ),
            ],
          )),
    );
  }
}

class StaticRouteArgs {
  String name = "默认";
  String message = "空";
  StaticRouteArgs(this.name, this.message);
}

class StaticRoutePage extends StatefulWidget {
  const StaticRoutePage({Key? key}) : super(key: key);

  @override
  _StaticRoutePageState createState() => _StaticRoutePageState();
}

class _StaticRoutePageState extends State<StaticRoutePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StaticRouteArgs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("静态路由"),
      ),
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Navigator.pushNamed()",
              style: TextStyle(color: Colors.red),
            ),
            Text("name:${args.name}"),
            Text("message:${args.message}"),
          ],
        ),
      ),
    );
  }
}
