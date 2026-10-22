
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

  final _buscaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  Future<void> _carregar() async {
    final termo = _buscaController.text.trim();

    final lista = termo.isEmpty
        ? await BancoHelper.listar()
        : await BancoHelper.buscar(termo);

    if (!mounted) return;

    setState(() {
      _contatos = lista;
    });
  }

  Future<void> _confirmarExclusao(Contato contato) async {
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir contato'),
        content: Text('Deseja excluir ${contato.nome}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmou == true && contato.id != null) {
      await BancoHelper.excluir(contato.id!);
      await _carregar();
    }
  }

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Contatos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _buscaController,
              decoration: const InputDecoration(
                hintText: 'Buscar por nome ou e-mail',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => _carregar(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contatos.length,
              itemBuilder: (context, i) {
                final c = _contatos[i];

                return ListTile(
                  title: Text(c.nome),
                  subtitle: Text(c.email),
                  onTap: () async {
                    final salvou = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TelaFormulario(contato: c),
                      ),
                    );

                    if (salvou == true) {
                      await _carregar();
                    }
                  },
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => _confirmarExclusao(c),
                  ),
                );
              },
            ),
          ),
        ],
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
  final Contato? contato;

  const TelaFormulario({super.key, this.contato});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.contato != null) {
      _nomeController.text = widget.contato!.nome;
      _emailController.text = widget.contato!.email;
    }
  }

  Future<void> _salvar() async {
    final contato = Contato(
      id: widget.contato?.id,
      nome: _nomeController.text,
      email: _emailController.text,
    );

    if (widget.contato == null) {
      await BancoHelper.inserir(contato);
    } else {
      await BancoHelper.atualizar(contato);
    }

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
    final editando = widget.contato != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          editando ? 'Editar contato' : 'Novo contato',
        ),
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
              child: Text(
                editando ? 'Salvar alterações' : 'Salvar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
