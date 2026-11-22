import 'package:flutter/material.dart';

import '../data/places.dart';
import 'simple_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static final List<Place> _allPlaces = [
    for (final category in categories) ...category.places,
  ];

  String _query = '';

  List<Place> get _results {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return _allPlaces;
    return _allPlaces
        .where(
          (p) =>
              p.name.toLowerCase().contains(q) ||
              p.category.toLowerCase().contains(q),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: buildBoldAppBar('Search'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Buscar locais...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum local encontrado.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )
                : ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final place = results[index];
                      return ListTile(
                        leading: const Icon(Icons.place_outlined),
                        title: Text(place.name),
                        subtitle: Text(place.category),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
