import 'package:flutter/material.dart';

class ScrollListDemo extends StatelessWidget {
  const ScrollListDemo({super.key});

  static const List<String> people = [
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
    'Heidi',
    'Ivan',
    'Judy',
    'Maico',
    'Statani',
    'wibu',
    'smae',
    'wllyy',
    "jar",
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
    'Heidi',
    'Ivan',
    'Judy',
    'Maico',
    'Statani',
    'wibu',
    'smae',
    'wllyy',
    "jar",
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
    'Heidi',
    'Ivan',
    'Judy',
    'Maico',
    'Statani',
    'wibu',
    'smae',
    'wllyy',
    "jar",
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
    'Heidi',
    'Ivan',
    'Judy',
    'Maico',
    'Statani',
    'wibu',
    'smae',
    'wllyy',
    "jar",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'ListView'),
              Tab(text: 'GridView.extent'),
              Tab(text: 'GridView.count'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildHorizontalListView(),
                _buildGridViewExtent(),
                _buildGridViewCount(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalListView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: people.map((p) => PersonCard(name: p)).toList()),
    );
  }

  Widget _buildGridViewExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(8),
      children: people.map((p) => PersonCard(name: p)).toList(),
    );
  }

  Widget _buildGridViewCount() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(8),
      children: people.map((p) => PersonCard(name: p)).toList(),
    );
  }
}

class PersonCard extends StatelessWidget {
  final String name;
  const PersonCard({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Colors.green[100],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(name, style: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
