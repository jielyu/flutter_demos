import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'image_picker_page.dart';
import 'provider_page.dart';
import 'webview_flutter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/home": (context) => const HomePage(),
    "/webview_flutter": (context) => const WebviewPage(),
    "/provider": (context) => const ProviderPage(),
    "/image_picker": (context) => const ImagePickerPage(),
  };
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: _routes,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isStatusWhite = true;
  Widget _buildListItem(String name, IconData icon) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          child: ListTile(
            leading: Icon(icon),
            onTap: () {
              print(name);
              Navigator.of(context).pushNamed("/" + name);
            },
            title: Text(name),
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("有用的Flutter"),
      ),
      body: ListView(
        children: [
          _buildListItem("webview_flutter", Icons.web),
          _buildListItem("provider", Icons.person),
          _buildListItem("image_picker", Icons.person),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text("flutter_statusbarcolor_ns"),
            onTap: () {
              // 设置状态栏的颜色
              _isStatusWhite = !_isStatusWhite;
              FlutterStatusbarcolor.setStatusBarWhiteForeground(_isStatusWhite);
            },
          )
        ],
      ),
    );
  }
}
