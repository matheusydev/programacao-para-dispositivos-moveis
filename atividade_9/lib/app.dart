import 'package:flutter/material.dart';

import 'pages/contatos_page.dart';

class ContatosApp extends StatelessWidget {
  const ContatosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ContatosPage(),
    );
  }
}
