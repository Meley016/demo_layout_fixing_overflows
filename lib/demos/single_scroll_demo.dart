import 'package:flutter/material.dart';

class SingleScrollDemo extends StatelessWidget {
  const SingleScrollDemo({super.key});

  static const words = [
    'tenus',
    'instantter',
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children:
            words
                .map(
                  (word) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(word, style: TextStyle(fontSize: 18)),
                  ),
                )
                .toList(),
      ),
    );
  }
}
