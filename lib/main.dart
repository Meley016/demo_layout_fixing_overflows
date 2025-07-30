import 'package:flutter/material.dart';
import 'demos/word_wrap_demo.dart';
import 'demos/single_scroll_demo.dart';
import 'demos/flexible_demo.dart';
import 'demos/scroll_list_demo.dart';

void main() => runApp(const OverflowDemoApp());

class OverflowDemoApp extends StatelessWidget {
  const OverflowDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Overflow Demos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OverflowTabPage(),
    );
  }
}

class OverflowTabPage extends StatelessWidget {
  const OverflowTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Overflow Demos'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Wrap'),
              Tab(text: 'SingleChildScrollView'),
              Tab(text: 'Flexible / FittedBox'),
              Tab(text: 'ListView / GridView'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WordWrapDemo(),
            SingleScrollDemo(),
            FlexibleDemo(),
            ScrollListDemo(),
          ],
        ),
      ),
    );
  }
}
