import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SliverListLayoutDemo extends StatelessWidget {
  const SliverListLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverList"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return ListTile(
                  leading: Text("$index 项目"),
                  trailing: Icon(Icons.face),
                );
              }, childCount: 14),
            ),
          ),
        ],
      ),
    );
  }
}
