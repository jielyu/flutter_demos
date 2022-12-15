import 'package:d0021_layout/pages/align.dart';
import 'package:d0021_layout/pages/aspect_ratio.dart';
import 'package:d0021_layout/pages/column.dart';
import 'package:d0021_layout/pages/constrained_box.dart';
import 'package:d0021_layout/pages/container.dart';
import 'package:d0021_layout/pages/cupertino_sliver_navigation_bar.dart';
import 'package:d0021_layout/pages/custom_multi_child_ayout.dart';
import 'package:d0021_layout/pages/custom_scroll_view.dart';
import 'package:d0021_layout/pages/expanded.dart';
import 'package:d0021_layout/pages/fitted_box.dart';
import 'package:d0021_layout/pages/flow.dart';
import 'package:d0021_layout/pages/fractionally_sized_box.dart';
import 'package:d0021_layout/pages/grid_view.dart';
import 'package:d0021_layout/pages/indexed_stack.dart';
import 'package:d0021_layout/pages/layout_builder.dart';
import 'package:d0021_layout/pages/list_view.dart';
import 'package:d0021_layout/pages/offstage.dart';
import 'package:d0021_layout/pages/padding.dart';
import 'package:d0021_layout/pages/row.dart';
import 'package:d0021_layout/pages/sized_box.dart';
import 'package:d0021_layout/pages/sliver_app_bar.dart';
import 'package:d0021_layout/pages/sliver_fixed_extent_list.dart';
import 'package:d0021_layout/pages/sliver_grid.dart';
import 'package:d0021_layout/pages/sliver_list.dart';
import 'package:d0021_layout/pages/stack.dart';
import 'package:d0021_layout/pages/table.dart';
import 'package:d0021_layout/pages/transform.dart';
import 'package:d0021_layout/pages/wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget _buildDemoItem(BuildContext context, name, Widget page) {
  return ListTile(
    title: Text(name),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },
  );
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Single-child"),
              _buildDemoItem(context, "Align", const AlignLayoutDemo()),
              _buildDemoItem(
                  context, "AspectRatio", const AspectRatioLayoutDemo()),
              _buildDemoItem(
                  context, "ConstrainedBox", const ConstrainedBoxLayoutDemo()),
              _buildDemoItem(context, "Container", const ContainerLayoutDemo()),
              _buildDemoItem(context, "Expanded", const ExpandedLayoutDemo()),
              _buildDemoItem(context, "FittedBox", const FittedBoxLayoutDemo()),
              _buildDemoItem(context, "FractionallySizedBox",
                  const FractionallySizedBoxLayoutDemo()),
              _buildDemoItem(context, "Offstage", const OffstageLayoutDemo()),
              _buildDemoItem(context, "Padding", const PaddingLayoutDemo()),
              _buildDemoItem(context, "SizedBox", const SizedBoxLayoutDemo()),
              _buildDemoItem(context, "Transform", const TransformLayoutDemo()),
              const Text("Multi-child"),
              _buildDemoItem(context, "Column", const ColumnLayoutDemo()),
              _buildDemoItem(context, "CustomMultiChildLayout",
                  const CustomMultiChildLayoutLayoutDemo()),
              _buildDemoItem(context, "Flow", const FlowLayoutDemo()),
              _buildDemoItem(context, "GridView", const GridViewLayoutDemo()),
              _buildDemoItem(
                  context, "IndexedStack", const IndexedStackLayoutDemo()),
              _buildDemoItem(
                  context, "LayoutBuilder", const LayoutBuilderLayoutDemo()),
              _buildDemoItem(context, "ListView", const ListViewLayoutDemo()),
              _buildDemoItem(context, "Row", const RowLayoutDemo()),
              _buildDemoItem(context, "Stack", const StackLayoutDemo()),
              _buildDemoItem(context, "Table", const TableLayoutDemo()),
              _buildDemoItem(context, "Wrap", const WrapLayoutDemo()),
              const Text("Sliver"),
              _buildDemoItem(context, "CupertinoSliverNavigationBar",
                  const CupertinoSliverNavigationBarDemo()),
              _buildDemoItem(context, "CustomScrollView",
                  const CustomScrollViewLayoutDemo()),
              _buildDemoItem(context, "SliverAppBar", const SliverAppBarDemo()),
              _buildDemoItem(context, "SliverFixedExtentList",
                  const SliverFixedExtentListLayoutDemo()),
              _buildDemoItem(
                  context, "SliverList", const SliverListLayoutDemo()),
              _buildDemoItem(
                  context, "SliverGrid", const SliverGridLayoutDemo()),
            ],
          ),
        ),
      ),
    );
  }
}
