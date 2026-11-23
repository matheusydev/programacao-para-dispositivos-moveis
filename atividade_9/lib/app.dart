import 'package:flutter/material.dart';

import 'pages/contatos_page.dart';

class ContatosApp extends StatelessWidget {
  const ContatosApp({required this.inicializacao, super.key});

  final Future<void> inicializacao;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: FutureBuilder<void>(
        future: inicializacao,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Conectando ao Firebase',
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            final mensagem = snapshot.error is UnsupportedError
                ? 'Configure o Firebase seguindo o README da atividade.'
                : 'Falha ao iniciar o Firebase. Verifique a conexão e a configuração.';
            return Scaffold(
              appBar: AppBar(title: const Text('Contatos')),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(mensagem, textAlign: TextAlign.center),
                ),
              ),
            );
          }
          return const ContatosPage();
        },
      ),
    );
  }
}
