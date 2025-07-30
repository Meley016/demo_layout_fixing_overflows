import 'package:flutter/material.dart';

class FlexibleDemo extends StatefulWidget {
  const FlexibleDemo({super.key});

  @override
  _FlexibleDemoState createState() => _FlexibleDemoState();
}

class _FlexibleDemoState extends State<FlexibleDemo> {
  bool useFlexible = false;
  bool useFittedBox = false;
  BoxFit selectedBoxFit = BoxFit.contain;

  final List<String> words = [
    'Flutter',
    'is',
    'amazing',
    'for',
    'mobile',
    'development',
    'and',
    'cross-platform',
    'applications',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Controls:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text('Use Flexible'),
                        value: useFlexible,
                        onChanged: (value) {
                          setState(() {
                            useFlexible = value!;
                            if (useFlexible) useFittedBox = false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: const Text('Use FittedBox'),
                        value: useFittedBox,
                        onChanged: (value) {
                          setState(() {
                            useFittedBox = value!;
                            if (useFittedBox) useFlexible = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                if (useFittedBox) ...[
                  const SizedBox(height: 10),
                  const Text('BoxFit Type:'),
                  DropdownButton<BoxFit>(
                    value: selectedBoxFit,
                    isExpanded: true,
                    items:
                        BoxFit.values.map((fit) {
                          return DropdownMenuItem(
                            value: fit,
                            child: Text(fit.toString().split('.').last),
                          );
                        }).toList(),
                    onChanged: (fit) {
                      setState(() {
                        selectedBoxFit = fit!;
                      });
                    },
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    'Normal Row (Will Overflow)',
                    _buildNormalRow(),
                    Colors.red[100]!,
                  ),
                  const SizedBox(height: 20),
                  if (useFlexible)
                    _buildSection(
                      'With Flexible (Squeezed to Fit)',
                      _buildFlexibleRow(),
                      Colors.green[100]!,
                    ),
                  if (useFittedBox)
                    _buildSection(
                      'With FittedBox (${selectedBoxFit.toString().split('.').last})',
                      _buildFittedBoxRow(),
                      Colors.blue[100]!,
                    ),
                  const SizedBox(height: 30),
                  const Text(
                    'Column Examples:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSection(
                          'Normal Column',
                          SizedBox(height: 200, child: _buildNormalColumn()),
                          Colors.orange[100]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (useFlexible)
                        Expanded(
                          child: _buildSection(
                            'Flexible Column',
                            SizedBox(
                              height: 200,
                              child: _buildFlexibleColumn(),
                            ),
                            Colors.purple[100]!,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget child, Color backgroundColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _buildNormalRow() {
    return Row(children: words.map((word) => WordWidget(word)).toList());
  }

  Widget _buildFlexibleRow() {
    return Row(
      children: words.map((word) => Flexible(child: WordWidget(word))).toList(),
    );
  }

  Widget _buildFittedBoxRow() {
    return FittedBox(
      fit: selectedBoxFit,
      child: Row(children: words.map((word) => WordWidget(word)).toList()),
    );
  }

  Widget _buildNormalColumn() {
    return Column(
      children: [
        BigTextWidget('Very Long Text That Will Overflow'),
        BigTextWidget('Another Long Text'),
        BigTextWidget('More Text Here'),
        BigTextWidget('Even More Text'),
      ],
    );
  }

  Widget _buildFlexibleColumn() {
    return Column(
      children: [
        Flexible(child: BigTextWidget('Very Long Text That Will Overflow')),
        Flexible(child: BigTextWidget('Another Long Text')),
        Flexible(child: BigTextWidget('More Text Here')),
        Flexible(child: BigTextWidget('Even More Text')),
      ],
    );
  }
}

class WordWidget extends StatelessWidget {
  final String word;
  const WordWidget(this.word, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue[600]!),
      ),
      child: Text(
        word,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class BigTextWidget extends StatelessWidget {
  final String text;
  const BigTextWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
