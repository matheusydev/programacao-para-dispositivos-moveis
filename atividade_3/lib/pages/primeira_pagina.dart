import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget {
  final String titulo;

  const PrimeiraPagina({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(titulo), // título da página atual
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Ir para a Segunda Página'),
          onPressed: () {
            // pushNamed: abre a página pelo nome da rota
            Navigator.pushNamed(context, '/segunda');
          },
        ),
      ),
    );
  }
}