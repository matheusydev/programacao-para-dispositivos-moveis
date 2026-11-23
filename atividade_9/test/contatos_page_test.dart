import 'dart:async';

import 'package:atividade_9/models/contato.dart';
import 'package:atividade_9/pages/contatos_page.dart';
import 'package:atividade_9/services/contatos_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('valida, cadastra, edita e confirma a exclusão', (tester) async {
    final servico = _ContatosEmMemoria();
    addTearDown(servico.fechar);
    await tester.pumpWidget(MaterialApp(home: ContatosPage(servico: servico)));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    servico.emitir();
    await tester.pumpAndSettle();
    expect(find.text('Nenhum contato cadastrado'), findsOneWidget);

    await tester.tap(find.text('Adicionar contato'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Salvar contato'));
    await tester.pumpAndSettle();
    expect(find.text('Informe o nome.'), findsOneWidget);
    expect(find.text('Informe o e-mail.'), findsOneWidget);

    final nome = find.byType(TextFormField).at(0);
    final email = find.byType(TextFormField).at(1);
    await tester.enterText(nome, 'Ana Lima');
    await tester.enterText(email, 'inválido');
    await tester.tap(find.text('Salvar contato'));
    await tester.pumpAndSettle();
    expect(find.text('Informe um e-mail válido.'), findsOneWidget);
    expect(servico.contatos, isEmpty);

    await tester.enterText(email, 'ana@example.com');
    await tester.tap(find.text('Salvar contato'));
    await tester.pumpAndSettle();
    expect(find.text('Ana Lima'), findsOneWidget);
    expect(find.text('ana@example.com'), findsOneWidget);
    final id = servico.contatos.single.id;

    await tester.tap(find.byTooltip('Editar contato'));
    await tester.pumpAndSettle();
    expect(find.text('Ana Lima'), findsOneWidget);
    expect(find.text('ana@example.com'), findsOneWidget);
    await tester.enterText(nome, 'Ana Silva');
    await tester.tap(find.text('Salvar contato'));
    await tester.pumpAndSettle();
    expect(find.text('Ana Silva'), findsOneWidget);
    expect(servico.contatos.single.id, id);

    await tester.tap(find.byTooltip('Excluir contato'));
    await tester.pumpAndSettle();
    expect(find.text('Excluir contato?'), findsOneWidget);
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    expect(find.text('Ana Silva'), findsOneWidget);
    await tester.tap(find.byTooltip('Excluir contato'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Excluir'));
    await tester.pumpAndSettle();
    expect(find.text('Nenhum contato cadastrado'), findsOneWidget);
    expect(servico.contatos, isEmpty);
  });

  testWidgets('mostra falha na consulta e recupera a lista ao tentar de novo', (
    tester,
  ) async {
    final servico = _ContatosEmMemoria();
    addTearDown(servico.fechar);
    await tester.pumpWidget(MaterialApp(home: ContatosPage(servico: servico)));

    servico.falhar();
    await tester.pumpAndSettle();
    expect(find.text('Não foi possível carregar os contatos.'), findsOneWidget);
    await tester.tap(find.text('Tentar novamente'));
    await tester.pump();
    servico.emitir();
    await tester.pumpAndSettle();
    expect(find.text('Nenhum contato cadastrado'), findsOneWidget);
  });
}

class _ContatosEmMemoria implements ContatosService {
  final _eventos = StreamController<List<Contato>>.broadcast();
  final contatos = <Contato>[];

  @override
  Stream<List<Contato>> observar() => _eventos.stream.map(List<Contato>.of);

  @override
  Future<void> salvar({
    String? id,
    required String nome,
    required String email,
  }) async {
    final contato = Contato(id: id ?? 'novo-id', nome: nome, email: email);
    if (id == null) {
      contatos.add(contato);
    } else {
      contatos[contatos.indexWhere((item) => item.id == id)] = contato;
    }
    emitir();
  }

  @override
  Future<void> excluir(String id) async {
    contatos.removeWhere((contato) => contato.id == id);
    emitir();
  }

  void emitir() => _eventos.add(List.of(contatos));
  void falhar() => _eventos.addError(StateError('Falha de conexão'));
  Future<void> fechar() => _eventos.close();
}
