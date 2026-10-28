# Atividade 5 — Agenda de Contatos com SqFlite

Aplicativo Flutter para armazenar, consultar, alterar e excluir contatos usando um banco de dados SQLite local.

Desenvolvido para a disciplina **Programação para Dispositivos Móveis**, ministrada pelo professor **Otílio Paulo**.

## Como funciona

A tela inicial lista os contatos salvos em ordem alfabética. A partir dela, o usuário pode:

- **Cadastrar:** o botão **+** abre o formulário com os campos nome e e-mail.
- **Consultar:** o campo de busca filtra a lista por nome ou e-mail enquanto o usuário digita.
- **Alterar:** tocar em um contato abre o mesmo formulário já preenchido.
- **Excluir:** o ícone da lixeira pede uma confirmação antes de apagar.

Os dados ficam gravados no aparelho, então continuam lá depois que o app é fechado.

## Banco de dados

O banco `banco.db` é criado na primeira execução, com a tabela:

```sql
CREATE TABLE contatos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
)
```

- `id` é gerado pelo próprio banco e nunca se repete.
- `email` é `UNIQUE`, então dois contatos não podem ter o mesmo e-mail.

## Estrutura do código

```
lib/
├── contato.dart        # modelo Contato, com toMap() e fromMap()
├── banco_helper.dart   # acesso ao banco: inserir, listar, buscar, atualizar e excluir
└── main.dart           # telas: lista de contatos e formulário
```

## Conceitos utilizados

- `openDatabase`, `getDatabasesPath` e `join` para criar e abrir o banco
- `insert`, `query`, `update` e `delete` do sqflite para o CRUD
- `where` com `?` e `whereArgs` para filtrar com segurança, e `LIKE` para a busca parcial
- Classe modelo com conversão entre objeto e `Map`
- `StatefulWidget` e `setState` para atualizar a lista
- `Navigator.push` e `Navigator.pop` para abrir o formulário e devolver se algo foi salvo
- `AlertDialog` com `showDialog` para confirmar a exclusão
- Um único formulário reaproveitado para cadastrar e alterar

## Como executar

```bash
flutter pub get
flutter run
```

O sqflite funciona no **Android** e no **iOS**, mas **não funciona no navegador**. Para rodar no **Windows**, o projeto usa o pacote `sqflite_common_ffi`, que é ativado automaticamente no `main()`:

```bash
flutter run -d windows
```

## Autor

Matheus Ylan Araujo Moraes — Matrícula 2025111TADS0039