# Programação para Dispositivos Móveis

Repositório com as atividades práticas da disciplina **Programação para Dispositivos Móveis**, ministrada pelo professor **Otílio Paulo**.

Todas as atividades foram desenvolvidas em **Flutter** com **Dart** e **Material Design 3**. Cada pasta é um projeto independente, com seu próprio README explicando os requisitos, os conceitos usados e como executar.

## Atividades

| # | Projeto | Descrição | Principais conceitos |
|---|---------|-----------|----------------------|
| 1 | [Banco App](atividade_1/) | Tela inicial de um app de banco com menu lateral e lista de opções. | `ThemeData`, `Drawer`, `DrawerHeader`, `ListView`, `ListTile` |
| 2 | [Lista de Compras](atividade_2/) | Lista de compras em que os itens podem ser marcados, com contador e barra de progresso. | `ListView.builder`, `CheckboxListTile`, `StatefulWidget`, classes de modelo |
| 3 | [Navegação entre Páginas](atividade_3/) | Duas páginas que trocam entre si, primeiro com `push`/`pop` e depois com rotas nomeadas. | `Navigator.push`, `Navigator.pop`, `MaterialPageRoute`, `routes`, `pushNamed` |
| 4 | [Gasolina x Álcool](atividade_4/) | Calculadora que indica qual combustível compensa mais a partir dos preços informados. | `TextField`, `TextEditingController`, `AnimatedContainer`, `Image.network` |
| 5 | [Agenda de Contatos](atividade_5/) | Agenda com cadastro, busca, edição e exclusão de contatos salvos em banco SQLite local. | `sqflite`, CRUD, `AlertDialog`, modelo com `toMap`/`fromMap` |

## Estrutura do repositório

```text
programacao-para-dispositivos-moveis/
├── atividade_1/   # Banco App
├── atividade_2/   # Lista de Compras
├── atividade_3/   # Navegação entre Páginas
├── atividade_4/   # Gasolina x Álcool
├── atividade_5/   # Agenda de Contatos com SqFlite
└── README.md
```

## Tecnologias

- [Flutter](https://flutter.dev/) (canal stable)
- [Dart](https://dart.dev/) `^3.13.4`
- Material Design 3
- [sqflite](https://pub.dev/packages/sqflite) e [sqflite_common_ffi](https://pub.dev/packages/sqflite_common_ffi) (atividade 5)

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado
- Emulador Android, dispositivo físico ou navegador

Para conferir se o ambiente está pronto:

```bash
flutter doctor
```

## Como executar

1. Clone o repositório:

   ```bash
   git clone https://github.com/<seu-usuario>/programacao-para-dispositivos-moveis.git
   cd programacao-para-dispositivos-moveis
   ```

2. Entre na pasta da atividade desejada:

   ```bash
   cd atividade_1
   ```

3. Instale as dependências e execute:

   ```bash
   flutter pub get
   flutter run
   ```

### Plataformas

| Atividade | Android | Web | Windows |
|-----------|:-------:|:---:|:-------:|
| 1 a 4     | ✅ | ✅ | — |
| 5         | ✅ | ❌ | ✅ |

A atividade 5 usa SQLite, que não funciona no navegador. No Windows, rode com:

```bash
flutter run -d windows
```

## Autor

**Matheus Ylan Araujo Moraes** — Matrícula 2025111TADS0039
