# Atividade 9 — CRUD de Contatos com Flutter e Firebase

Projeto da disciplina **Programação para Dispositivos Móveis** do IFPI, ministrada pelo professor Otílio Paulo. O objetivo é cadastrar, consultar, editar e excluir contatos com identificador, nome e e-mail.

## Funcionalidades

- Cadastro com validação de nome e e-mail.
- Listagem em ordem de nome, com atualização automática pelo Firestore.
- Edição em um formulário preenchido com os dados atuais, preservando o ID.
- Exclusão com confirmação e mensagens de sucesso ou erro.
- Autenticação anônima para restringir os contatos ao titular do UID.

## Tecnologias

- Flutter, Dart e Material 3.
- Firebase CLI e FlutterFire CLI.
- `firebase_core`, `firebase_auth` e `cloud_firestore`.

## Estrutura

- [main.dart](lib/main.dart) inicia o aplicativo.
- [app.dart](lib/app.dart) define o tema e a página inicial.
- [contatos_page.dart](lib/pages/contatos_page.dart) lista os contatos e confirma exclusões.
- [contato_form_page.dart](lib/pages/contato_form_page.dart) valida o cadastro e a edição.
- [contato.dart](lib/models/contato.dart) representa os dados de um contato.
- [contatos_service.dart](lib/services/contatos_service.dart) acessa a coleção do usuário no Firestore.
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

O projeto de demonstração usa apenas os emuladores e dispensa uma conta do Firebase.

## Testes

Execute `flutter test` para verificar o fluxo da interface com um serviço em memória. Para executar também o teste de CRUD e de regras do Firestore via HTTP, mantenha os emuladores de autenticação e banco ativos e rode:

~~~bash
flutter test --dart-define=FIREBASE_EMULATORS=true
~~~

O CRUD também foi verificado pela interface no Chrome com a Firebase Emulator Suite. Para repetir a verificação manual, cadastre um contato de exemplo, confira a listagem, edite o nome e confirme a exclusão. O teste local usa dados fictícios.

## Entrega

O [relatório em PDF](atividade_9_relatorio.pdf) reúne o código-fonte escrito para o aplicativo, a configuração das dependências, as regras do Firestore e capturas reais do CRUD no Chrome com os emuladores locais.
