import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/contato.dart';

abstract interface class ContatosService {
  Stream<List<Contato>> observar();
  Future<void> salvar({
    String? id,
    required String nome,
    required String email,
  });
  Future<void> excluir(String id);
}

class ContatosFirestore implements ContatosService {
  ContatosFirestore(FirebaseFirestore firestore, String uid)
    : _contatos = firestore
          .collection('usuarios')
          .doc(uid)
          .collection('contatos');

  final CollectionReference<Map<String, dynamic>> _contatos;

  @override
  Stream<List<Contato>> observar() {
    return _contatos
        .orderBy('nome')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Contato.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  @override
  Future<void> salvar({
    String? id,
    required String nome,
    required String email,
  }) async {
    final documento = _contatos.doc(id);
    if (id == null) {
      await documento.set(
        Contato(id: documento.id, nome: nome, email: email).toMap(),
      );
    } else {
      await documento.update({'nome': nome, 'email': email});
    }
  }

  @override
  Future<void> excluir(String id) => _contatos.doc(id).delete();
}
