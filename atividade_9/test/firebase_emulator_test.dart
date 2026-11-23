import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('somente o titular acessa os contatos e o ID corresponde ao documento', () async {
    final cliente = HttpClient()
      ..connectionTimeout = const Duration(seconds: 5);
    addTearDown(() => cliente.close(force: true));

    Future<({int status, String corpo})> requisicao(
      String metodo,
      String url, {
      String? token,
      Map<String, Object?>? dados,
    }) async {
      final pedido = await cliente.openUrl(metodo, Uri.parse(url));
      if (token != null) {
        pedido.headers.set(HttpHeaders.authorizationHeader, 'Bearer $token');
      }
      if (dados != null) {
        pedido.headers.contentType = ContentType.json;
        pedido.write(jsonEncode(dados));
      }
      final resposta = await pedido.close();
      return (
        status: resposta.statusCode,
        corpo: await resposta.transform(utf8.decoder).join(),
      );
    }

    Future<Map<String, dynamic>> entrar() async {
      final resposta = await requisicao(
        'POST',
        'http://127.0.0.1:9099/identitytoolkit.googleapis.com/v1/accounts:signUp?key=demo-key',
        dados: {'returnSecureToken': true},
      );
      expect(resposta.status, HttpStatus.ok);
      return jsonDecode(resposta.corpo) as Map<String, dynamic>;
    }

    final titular = await entrar();
    final outroUsuario = await entrar();
    final token = titular['idToken'] as String;
    const id = 'contato-teste';
    final url =
        'http://127.0.0.1:8080/v1/projects/demo-atividade-9/databases/(default)'
        '/documents/usuarios/${titular['localId']}/contatos/$id';
    Map<String, Object?> contato(
      String identificador, {
      String email = 'contato@example.com',
    }) => {
      'fields': {
        'id': {'stringValue': identificador},
        'nome': {'stringValue': 'Contato exemplo'},
        'email': {'stringValue': email},
      },
    };

    final criado = await requisicao(
      'PATCH',
      url,
      token: token,
      dados: contato(id),
    );
    expect(criado.status, HttpStatus.ok);
    try {
      expect(
        (await requisicao('GET', url, token: token)).status,
        HttpStatus.ok,
      );
      expect(
        (await requisicao(
          'GET',
          url,
          token: outroUsuario['idToken'] as String,
        )).status,
        HttpStatus.forbidden,
      );
      expect((await requisicao('GET', url)).status, HttpStatus.forbidden);
      final editado = await requisicao(
        'PATCH',
        url,
        token: token,
        dados: contato(id, email: 'atualizado@example.com'),
      );
      expect(editado.status, HttpStatus.ok);
      final consulta = await requisicao('GET', url, token: token);
      expect(consulta.status, HttpStatus.ok);
      final campos = (jsonDecode(consulta.corpo) as Map)['fields'] as Map;
      expect(campos['id']['stringValue'], id);
      expect(campos['email']['stringValue'], 'atualizado@example.com');

      final idAlterado = await requisicao(
        'PATCH',
        url,
        token: token,
        dados: contato('id-diferente'),
      );
      expect(idAlterado.status, HttpStatus.forbidden);
    } finally {
      expect(
        (await requisicao('DELETE', url, token: token)).status,
        HttpStatus.ok,
      );
    }
    final excluido = await requisicao('GET', url, token: token);
    expect(excluido.status, HttpStatus.notFound);
  }, skip: !const bool.fromEnvironment('FIREBASE_EMULATORS'));
}
