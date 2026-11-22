import 'package:flutter/material.dart';

import '../data/places.dart';
import '../widgets/category_card.dart';
import 'category_page.dart';
import 'nearby_page.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  void _openCategory(BuildContext context, Category category) {
    final Widget page = category.title == 'Nearby'
        ? NearbyPage(places: category.places)
        : CategoryPage(category: category);

    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text(
          'Discovery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 16.0;
            const columns = 2;
            final rows = (categories.length / columns).ceil();

            final cellWidth =
                (constraints.maxWidth - spacing * (columns + 1)) / columns;
            final cellHeight =
                (constraints.maxHeight - spacing * (rows + 1)) / rows;
            final aspectRatio = cellWidth / cellHeight.clamp(150.0, 600.0);

            return GridView.builder(
              padding: const EdgeInsets.all(spacing),
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                childAspectRatio: aspectRatio,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  category: category,
                  onTap: () => _openCategory(context, category),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
