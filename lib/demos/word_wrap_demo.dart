import 'package:flutter/material.dart';

class WordWrapDemo extends StatelessWidget {
  const WordWrapDemo({super.key});

  static const List<String> words = [
    'tenus',
    'imantur',
    'pulchritudinis',
    'senectus',
    'praesto',
    'sumo',
    'calamitas',
    'peior',
    'nobis',
    'macero',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Wrap - Horizontal'),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          direction: Axis.vertical,
          children: words.map((word) => Chip(label: Text(word))).toList(),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Wrap - Vertical'),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          direction: Axis.vertical,
          children: words.map((word) => Chip(label: Text(word))).toList(),
        ),
      ],
    );
  }
}
