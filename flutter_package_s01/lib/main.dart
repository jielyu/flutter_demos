import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:rxdart/subjects.dart';

import 'image_picker_page.dart';
import 'provider_page.dart';
import 'webview_flutter_page.dart';
import 'local_notification_page.dart';
import 'awesome_dialog_page.dart';
import 'color_picker_page.dart';
import 'file_picker_page.dart';
import 'qr_code_page.dart';
import 'share_page.dart';
import 'sqflite_page.dart';
import 'video_player_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/home": (context) => const HomePage(),
    "/webview_flutter": (context) => const WebviewPage(),
    "/provider": (context) => const ProviderPage(),
    "/image_picker": (context) => const ImagePickerPage(),
    "/local_notification": (context) => const LocalNotificationPage(),
    "/sqflite": (context) => const SqflitePage(),
    "/video_player": (context) => const VideoPlayerPage(),
    "/qr_code": (context) => const QRCodePage(),
    "/color_picker": (context) => const ColorPickerPage(),
    "/awesome_dialog": (context) => const AwesomeDialog(),
    "/file_picker": (context) => const FilePickerPage(),
    "/share": (context) => const SharePage(),
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
          _buildListItem("local_notification", Icons.person),
          _buildListItem("sqflite", Icons.person),
          _buildListItem("video_player", Icons.person),
          _buildListItem("qr_code", Icons.person),
          _buildListItem("color_picker", Icons.person),
          _buildListItem("awesome_dialog", Icons.person),
          _buildListItem("file_picker", Icons.person),
          _buildListItem("share", Icons.person),
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
