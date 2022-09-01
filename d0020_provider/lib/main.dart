/// 演示使用provider状态管理的案例
/// 可以在移动端和桌面端都使用provider进行状态管理
/// 这也是flutter官方推荐的一种方式

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ProviderPage(),
    );
  }
}

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartCounter()),
      ],
      child: const TmpPage(),
    );
  }
}

class TmpPage extends StatefulWidget {
  const TmpPage({Key? key}) : super(key: key);

  @override
  State<TmpPage> createState() => _TmpPageState();
}

class _TmpPageState extends State<TmpPage> {
  @override
  Widget build(BuildContext context) {
    print("build _TmpPageState");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      bottomNavigationBar: const ProviderBottomBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("iPhone 13 Pro"),
              subtitle: const Text("性能超乎你想象"),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartCounter>().increment();
                      // print("increase");
                    },
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartCounter>().decrease();
                      // print("decrease");
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartCounter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrease() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}

class ProviderBottomBar extends StatelessWidget {
  const ProviderBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartCounter>().count;
    print("build ProviderBottomBar");
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6, top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.home),
            const Icon(Icons.message),
            cartCount > 0
                ? Badge(
                    position: BadgePosition.topEnd(),
                    badgeContent: Text(
                      "$cartCount",
                      // key: const Key('cartCounterState'),
                    ),
                    child: const Icon(Icons.card_travel),
                  )
                : const Icon(Icons.card_travel),
          ],
        ),
      ),
    );
  }
}
