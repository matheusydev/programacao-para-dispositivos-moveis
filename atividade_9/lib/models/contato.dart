class Contato {
  const Contato({required this.id, required this.nome, required this.email});

  final String id;
  final String nome;
  final String email;

  factory Contato.fromMap(String id, Map<String, dynamic> dados) {
    return Contato(
      id: id,
      nome: dados['nome'] as String,
      email: dados['email'] as String,
    );
  }

  Map<String, String> toMap() => {'id': id, 'nome': nome, 'email': email};
}
