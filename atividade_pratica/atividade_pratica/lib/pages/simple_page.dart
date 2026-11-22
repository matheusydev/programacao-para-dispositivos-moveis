import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const SimplePage({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: buildBoldAppBar(title),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 96, color: const Color(0xFFFFC107)),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildBoldAppBar(String title) {
  return AppBar(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    centerTitle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 0,
  );
}
