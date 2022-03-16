import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

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
              title: const Text("手机"),
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
