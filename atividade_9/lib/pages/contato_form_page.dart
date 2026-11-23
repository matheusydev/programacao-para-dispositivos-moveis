import 'package:flutter/material.dart';

import '../models/contato.dart';
import '../services/contatos_service.dart';

class ContatoFormPage extends StatefulWidget {
  const ContatoFormPage({required this.servico, this.contato, super.key});

  final ContatosService servico;
  final Contato? contato;

  @override
  State<ContatoFormPage> createState() => _ContatoFormPageState();
}

class _ContatoFormPageState extends State<ContatoFormPage> {
  static final _formatoEmail = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  final _formulario = GlobalKey<FormState>();
  late final _nome = TextEditingController(text: widget.contato?.nome);
  late final _email = TextEditingController(text: widget.contato?.email);
  bool _salvando = false;

  @override
  void dispose() {
    _nome.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    if (_salvando || !_formulario.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _salvando = true);
    try {
      await widget.servico.salvar(
        id: widget.contato?.id,
        nome: _nome.text.trim(),
        email: _email.text.trim(),
      );
      if (mounted) Navigator.of(context).pop(true);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível salvar o contato.')),
      );
    } finally {
      if (mounted) setState(() => _salvando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_salvando,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.contato == null ? 'Novo contato' : 'Editar contato',
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Form(
              key: _formulario,
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  TextFormField(
                    controller: _nome,
                    enabled: !_salvando,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.name],
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                    validator: (valor) =>
                        (valor ?? '').trim().isEmpty ? 'Informe o nome.' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _email,
                    enabled: !_salvando,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                    validator: (valor) {
                      final email = (valor ?? '').trim();
                      if (email.isEmpty) return 'Informe o e-mail.';
                      return _formatoEmail.hasMatch(email)
                          ? null
                          : 'Informe um e-mail válido.';
                    },
                    onFieldSubmitted: (_) => _salvar(),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _salvando ? null : _salvar,
                    child: Text(_salvando ? 'Salvando…' : 'Salvar contato'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
