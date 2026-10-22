import 'package:flutter/material.dart';

import 'banco_helper.dart';
import 'contato.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaLista(),
  ));
}

class TelaLista extends StatefulWidget {
  const TelaLista({super.key});

  @override
  State<TelaLista> createState() => _TelaListaState();
}

class _TelaListaState extends State<TelaLista> {
  List<Contato> _contatos = [];

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  Future<void> _carregar() async {
    final lista = await BancoHelper.listar();     // peça os contatos ao banco
    setState(() {
      _contatos = lista;               // guarde na variável da tela
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda de Contatos')),
      body: ListView.builder(
        itemCount: _contatos.length,          // quantos itens a lista tem?
        itemBuilder: (context, i) {
          final c = _contatos[i];
          return ListTile(
            title: Text(c.nome),    // mostre o nome
            subtitle: Text(c.email), // mostre o e-mail
          );
        },
      ),
    );
  }
}