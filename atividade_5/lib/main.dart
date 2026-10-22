
import 'package:flutter/material.dart';

import 'banco_helper.dart';
import 'contato.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLista(),
    ),
  );
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
    final lista = await BancoHelper.listar();

    if (!mounted) return;

    setState(() {
      _contatos = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Contatos'),
      ),
      body: ListView.builder(
        itemCount: _contatos.length,
        itemBuilder: (context, i) {
          final c = _contatos[i];

          return ListTile(
            title: Text(c.nome),
            subtitle: Text(c.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final salvou = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => const TelaFormulario(),
            ),
          );

          if (salvou == true) {
            await _carregar();
          }
        },
      ),
    );
  }
}

class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> _salvar() async {
    final contato = Contato(
      nome: _nomeController.text,
      email: _emailController.text,
    );

    await BancoHelper.inserir(contato);

    if (!mounted) return;

    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _salvar,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
