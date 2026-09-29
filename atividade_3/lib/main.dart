import 'package:flutter/material.dart';
import 'pages/primeira_pagina.dart';
import 'pages/segunda_pagina.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // Página inicial do app (rota root)
      initialRoute: '/',
      routes: {
        '/': (context) => const PrimeiraPagina(titulo: 'Primeira Página'),
        '/segunda': (context) => const SegundaPagina(titulo: 'Segunda Página'),
      },
    );
  }
}