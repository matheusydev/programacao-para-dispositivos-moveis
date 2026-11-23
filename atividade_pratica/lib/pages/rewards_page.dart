import 'package:flutter/material.dart';

import '../data/places.dart';
import 'simple_page.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  static final List<Place> _top10 = ([
    for (final category in categories) ...category.places,
  ]..sort((a, b) => b.rating.compareTo(a.rating))).take(10).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: buildBoldAppBar('Top Rated'),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _top10.length,
        itemBuilder: (context, index) {
          final place = _top10[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFFFE082),
              foregroundColor: Colors.black87,
              child: Text(
                '${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              place.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(place.category),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Color(0xFFFFC107), size: 18),
                const SizedBox(width: 2),
                Text(
                  place.rating.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
