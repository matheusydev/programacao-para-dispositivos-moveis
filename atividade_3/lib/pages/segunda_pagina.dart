import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  final String titulo;

  const SegundaPagina({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(titulo), // título da página atual
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.arrow_back),
          label: const Text('Voltar'),
          onPressed: () {
            // pop: remove a página atual da pilha e volta para a anterior
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}