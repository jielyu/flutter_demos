import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

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
import 'emoji_picker_page.dart';
import 'webview_flutter_page_android.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/home": (context) => const HomePage(),
    "/webview_flutter": (context) =>
        Platform.isAndroid ? const WebviewAndroidPage() : const WebviewPage(),
    "/provider": (context) => const ProviderPage(),
    "/image_picker": (context) => const ImagePickerPage(),
    "/local_notification": (context) => const LocalNotificationPage(),
    "/sqflite": (context) => const SqflitePage(),
    "/video_player": (context) => const VideoPlayerPage(),
    "/qr_code": (context) => const QRCodePage(),
    "/color_picker": (context) => const ColorPickerPage(),
    "/awesome_dialog": (context) => const AwesomeDialogPage(),
    "/file_picker": (context) => const FilePickerPage(),
    "/share": (context) => const SharePage(),
    "/emoji_picker": (context) => const EmojiPickerPage(),
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
          _buildListItem("provider", Icons.star_outline_sharp),
          _buildListItem("image_picker", Icons.image),
          _buildListItem("local_notification", Icons.notification_add),
          _buildListItem("sqflite", Icons.save_rounded),
          _buildListItem("video_player", Icons.video_call),
          _buildListItem("qr_code", Icons.qr_code),
          _buildListItem("color_picker", Icons.color_lens),
          _buildListItem("awesome_dialog", Icons.person),
          _buildListItem("file_picker", Icons.file_copy),
          _buildListItem("share", Icons.share),
          _buildListItem("emoji_picker", Icons.emoji_emotions),
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
