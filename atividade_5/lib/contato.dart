class Contato {
  int? id;
  String nome;
  String email;

  Contato({this.id, required this.nome, required this.email});

  // objeto -> Map (para gravar no banco)
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'nome': nome,
      'email': email,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  // Map -> objeto (para ler do banco)
  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'] as int,
      nome: map['nome'] as String,
      email: map['email'] as String,
    );
  }
}