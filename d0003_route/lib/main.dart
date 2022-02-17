import 'package:d0003_route/home_page.dart';
import 'package:flutter/material.dart';
import 'package:d0003_route/route_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/static_route": (context) => const StaticRoutePage(),
      },
      home: const HomePage(),
    );
  }
}
