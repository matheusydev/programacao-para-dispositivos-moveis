# Atividade 9 — CRUD de Contatos com Flutter e Firebase

Projeto da disciplina **Programação para Dispositivos Móveis** do IFPI, ministrada pelo professor Otílio Paulo. O objetivo é cadastrar, consultar, editar e excluir contatos com identificador, nome e e-mail.

## Etapa atual

A base usa Material 3 e apresenta a tela inicial da agenda. A conexão com o Firebase e as operações de contatos serão implementadas nas próximas etapas.

## Estrutura

- [main.dart](lib/main.dart) inicia o aplicativo.
- [app.dart](lib/app.dart) define o tema e a página inicial.
- [contatos_page.dart](lib/pages/contatos_page.dart) define a tela principal.

## Como executar

A partir da raiz do repositório:

~~~bash
cd atividade_9
flutter pub get
flutter run -d chrome
~~~

Para verificar o código, execute `flutter analyze` na pasta da atividade.
