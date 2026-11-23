import 'package:flutter/material.dart';

import '../models/contato.dart';
import '../services/contatos_service.dart';
import 'contato_form_page.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({required this.servico, super.key});

  final ContatosService servico;

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  late var _contatos = widget.servico.observar();
  final _excluindo = <String>{};

  void _mensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(texto)));
  }

  Future<void> _abrirFormulario([Contato? contato]) async {
    final salvo = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) =>
            ContatoFormPage(servico: widget.servico, contato: contato),
      ),
    );
    if (mounted && salvo == true) {
      _mensagem(
        contato == null ? 'Contato cadastrado.' : 'Contato atualizado.',
      );
    }
  }

  Future<void> _confirmarExclusao(Contato contato) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir contato?'),
        content: Text('Excluir “${contato.nome}” da agenda?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
    if (!mounted || confirmar != true || _excluindo.contains(contato.id)) {
      return;
    }

    setState(() => _excluindo.add(contato.id));
    try {
      await widget.servico.excluir(contato.id);
      if (mounted) _mensagem('Contato excluído.');
    } catch (_) {
      if (mounted) _mensagem('Não foi possível excluir o contato.');
    } finally {
      if (mounted) setState(() => _excluindo.remove(contato.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contatos')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirFormulario,
        icon: const Icon(Icons.person_add_outlined),
        label: const Text('Adicionar contato'),
      ),
      body: StreamBuilder<List<Contato>>(
        stream: _contatos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _estado(
              Icons.cloud_off_outlined,
              'Não foi possível carregar os contatos.',
              OutlinedButton(
                onPressed: () =>
                    setState(() => _contatos = widget.servico.observar()),
                child: const Text('Tentar novamente'),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'Carregando contatos',
              ),
            );
          }
          final contatos = snapshot.data!;
          if (contatos.isEmpty) {
            return _estado(
              Icons.contacts_outlined,
              'Nenhum contato cadastrado',
              const Text('Use Adicionar contato para começar.'),
            );
          }
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 96),
                itemCount: contatos.length,
                itemBuilder: (context, indice) {
                  final contato = contatos[indice];
                  final excluindo = _excluindo.contains(contato.id);
                  return Card(
                    key: ValueKey(contato.id),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person_outline),
                      ),
                      title: Text(contato.nome),
                      subtitle: Text(contato.email),
                      trailing: excluindo
                          ? const SizedBox.square(
                              dimension: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: 'Editar contato',
                                  onPressed: () => _abrirFormulario(contato),
                                  icon: const Icon(Icons.edit_outlined),
                                ),
                                IconButton(
                                  tooltip: 'Excluir contato',
                                  onPressed: () => _confirmarExclusao(contato),
                                  icon: const Icon(Icons.delete_outline),
                                ),
                              ],
                            ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _estado(IconData icone, String titulo, Widget detalhe) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              titulo,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            detalhe,
          ],
        ),
      ),
    );
  }
}
