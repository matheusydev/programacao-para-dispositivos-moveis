import 'package:flutter/material.dart';

import '../data/places.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.category, required this.onTap});

  static const _highlightColor = Color(0xFFFFEE8C);
  static const _radius = BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    final highlighted = category.highlighted;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: _radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: highlighted ? 0.12 : 0.06),
            blurRadius: highlighted ? 16 : 8,
            offset: Offset(0, highlighted ? 6 : 3),
          ),
        ],
      ),
      child: Material(
        color: highlighted ? _highlightColor : Colors.white,
        borderRadius: _radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category.icon, size: 52, color: Colors.black87),
                const SizedBox(height: 12),
                Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category.subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
