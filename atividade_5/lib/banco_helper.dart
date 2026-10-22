import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'contato.dart';

class BancoHelper {
  static const String _nomeBanco = 'banco.db';
  static const String tabela = 'contatos';

  static Future<Database> _openBanco() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, _nomeBanco);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, versaoRecente) async {
        final sql =
            'CREATE TABLE $tabela ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'nome TEXT NOT NULL, '
            'email TEXT NOT NULL UNIQUE)';
        await db.execute(sql);
      },
    );
  }

  // CREATE - armazena um contato e devolve o id gerado.
  static Future<int> inserir(Contato contato) async {
    final db = await _openBanco();
    return db.insert(tabela, contato.toMap());
  }

  // READ - lista todos os contatos
  static Future<List<Contato>> listar() async {
    final db = await _openBanco();
    final linhas = await db.query(tabela, orderBy: 'nome COLLATE NOCASE');
    return linhas.map((l) => Contato.fromMap(l)).toList();
  }

  // READ - consulta contatos pelo nome ou e-mail.
  static Future<List<Contato>> buscar(String termo) async {
    final db = await _openBanco();
    final linhas = await db.query(
      tabela,
      where: 'nome LIKE ? OR email LIKE ?',
      whereArgs: ['%$termo%', '%$termo%'],
      orderBy: 'nome COLLATE NOCASE',
    );
    return linhas.map((l) => Contato.fromMap(l)).toList();
  }

  // UPDATE - altera um contato existente
  static Future<int> atualizar(Contato contato) async {
    final db = await _openBanco();
    return db.update(
      tabela,
      contato.toMap(),
      where: 'id = ?',
      whereArgs: [contato.id],
    );
  }

  // DELETE - exclui um contato pelo id.
  static Future<int> excluir(int id) async {
    final db = await _openBanco();
    return db.delete(tabela, where: 'id = ?', whereArgs: [id]);
  }

}
