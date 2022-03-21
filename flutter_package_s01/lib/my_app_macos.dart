import 'package:flutter/material.dart';
import 'provider_page.dart';
import 'local_notification_page.dart';
import 'awesome_dialog_page.dart';
import 'color_picker_page.dart';
import 'file_picker_page.dart';
import 'sqflite_page.dart';
import 'emoji_picker_page.dart';

class MyAppMacOS extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/home": (context) => const HomePage(),
    "/provider": (context) => const ProviderPage(),
    "/local_notification": (context) => const LocalNotificationPage(),
    "/sqflite": (context) => const SqflitePage(),
    "/color_picker": (context) => const ColorPickerPage(),
    "/awesome_dialog": (context) => const AwesomeDialogPage(),
    "/file_picker": (context) => const FilePickerPage(),
    "/emoji_picker": (context) => const EmojiPickerPage(),
  };
  MyAppMacOS({Key? key}) : super(key: key);

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
          // _buildListItem("webview_flutter", Icons.web),
          _buildListItem("provider", Icons.star_outline_sharp),
          // _buildListItem("image_picker", Icons.image),
          _buildListItem("local_notification", Icons.notification_add),
          _buildListItem("sqflite", Icons.save_rounded),
          // _buildListItem("video_player", Icons.video_call),
          // _buildListItem("qr_code", Icons.qr_code),
          _buildListItem("color_picker", Icons.color_lens),
          _buildListItem("awesome_dialog", Icons.person),
          _buildListItem("file_picker", Icons.file_copy),
          // _buildListItem("share", Icons.share),
          _buildListItem("emoji_picker", Icons.emoji_emotions),
        ],
      ),
    );
  }
}
