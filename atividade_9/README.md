# Atividade 9 — CRUD de Contatos com Flutter e Firebase

Projeto da disciplina **Programação para Dispositivos Móveis** do IFPI, ministrada pelo professor Otílio Paulo. O objetivo é cadastrar, consultar, editar e excluir contatos com identificador, nome e e-mail.

## Etapa atual

O app Web usa Material 3 e inicia o Firebase antes de abrir a agenda. A autenticação anônima fornece um UID para que o Firestore isole os contatos por usuário. O formulário e as operações CRUD entram na próxima etapa.

## Tecnologias

- Flutter, Dart e Material 3.
- Firebase CLI e FlutterFire CLI.
- `firebase_core`, `firebase_auth` e `cloud_firestore`.

## Estrutura

- [main.dart](lib/main.dart) inicia o aplicativo.
- [app.dart](lib/app.dart) define o tema e a página inicial.
- [contatos_page.dart](lib/pages/contatos_page.dart) define a tela principal.

- [firebase_setup.dart](lib/firebase_setup.dart) inicializa o Firebase e a sessão anônima.
- [firestore.rules](firestore.rules) restringe os contatos ao titular da sessão.

## Configuração do Firebase

1. Crie ou selecione seu projeto no [Firebase Console](https://console.firebase.google.com/). Em **Authentication**, habilite o provedor **Anônimo**. Crie o banco **Cloud Firestore** em modo de produção.
2. Instale as CLIs e autentique a Firebase CLI com sua conta.

   ~~~bash
   npm install -g firebase-tools
   firebase login
   dart pub global activate flutterfire_cli
   ~~~

3. Na pasta `atividade_9/`, baixe as dependências e selecione seu projeto e a plataforma **Web**. A CLI registra o app Web e substitui `lib/firebase_options.dart` com as opções do projeto selecionado.

   ~~~bash
   flutter pub get
   flutterfire configure --platforms=web
   ~~~

   Se `flutterfire` estiver fora do PATH, use `dart pub global run flutterfire_cli:flutterfire configure --platforms=web`.

4. Confirme o ID do projeto antes de publicar as regras. Em um projeto compartilhado, revise as regras existentes com o responsável antes de substituí-las.

   ~~~bash
   firebase deploy --only firestore:rules --project SEU_ID_DO_PROJETO
   ~~~

As regras permitem o CRUD em `usuarios/{uid}/contatos/{id}` apenas para o UID autenticado que corresponde ao caminho. Cada documento guarda `id`, `nome` e `email`. O arquivo gerado pelo FlutterFire contém configuração de cliente. Chaves privadas e arquivos de conta de serviço devem ficar fora do repositório.

## Como executar

A partir da raiz do repositório:

~~~bash
cd atividade_9
flutter pub get
flutter run -d chrome
~~~

Para verificar o código, execute `flutter analyze` na pasta da atividade.


## Executar com os emuladores locais

Com a Firebase CLI e o Java instalados, rode na pasta da atividade:

~~~bash
firebase emulators:start --only auth,firestore --project demo-atividade-9
~~~

Em outro terminal, na mesma pasta:

~~~bash
flutter pub get
flutter run -d chrome --dart-define=FIREBASE_EMULATORS=true
~~~

O projeto de demonstração usa apenas os emuladores e dispensa uma conta do Firebase. A abertura da agenda demonstra a inicialização e a autenticação. A verificação do CRUD pela interface depende da próxima etapa.

Para verificar a autenticação e as regras de isolamento entre usuários, mantenha os emuladores abertos e rode:

~~~bash
flutter test --dart-define=FIREBASE_EMULATORS=true test/firebase_emulator_test.dart
~~~
