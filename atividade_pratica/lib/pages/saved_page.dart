import 'package:flutter/material.dart';

import 'simple_page.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Bookmark',
      icon: Icons.bookmark,
      message: 'Seus locais salvos aparecerão aqui.',
    );
  }
}
