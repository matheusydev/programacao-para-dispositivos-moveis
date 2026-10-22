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
}
