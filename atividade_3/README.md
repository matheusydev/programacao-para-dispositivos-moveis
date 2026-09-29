# Navegação entre Páginas - Atividade 3

Aplicação desenvolvida em Flutter para prática de navegação entre telas, utilizando o `Navigator` para gerenciar as páginas como uma pilha, com os métodos `push()` e `pop()`, e posteriormente com rotas nomeadas.

## Requisitos da Atividade

1. **Navegação com `push()` e `pop()`**
   * Criação de duas páginas: `PrimeiraPagina` e `SegundaPagina`.
   * Navegação para a segunda página com `Navigator.push()` e `MaterialPageRoute`.
   * Retorno à página anterior com `Navigator.pop()`.

2. **Título da página no `AppBar`**
   * Cada página recebe seu título pelo construtor e o exibe no `AppBar`.
   * Título centralizado e cor de fundo diferente em cada página.

3. **Navegação com rotas nomeadas**
   * Registro das rotas no `MaterialApp` com `initialRoute` e `routes`.
   * Página raiz definida na rota `'/'` e segunda página na rota `'/segunda'`.
   * Navegação com `Navigator.pushNamed()`.

## Tecnologias Utilizadas

* Flutter (SDK)
* Dart
* Material Design 3

## Plataformas Suportadas

* Android
* Web

## Pré-requisitos

* [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado
* Emulador Android, dispositivo físico ou navegador disponível

## Como Executar

1. Clone o repositório e acesse a pasta do projeto:

   ```bash
   cd atividade_3
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:

   ```bash
   flutter run
   ```

## Estrutura de Pastas

```
lib/
├── main.dart                  # MaterialApp com tema e rotas
└── pages/
    ├── primeira_pagina.dart   # Página inicial (rota '/')
    └── segunda_pagina.dart    # Segunda página (rota '/segunda')
```

## Estrutura do App

```
MaterialApp
├── initialRoute: '/'
└── routes
    ├── '/' → PrimeiraPagina
    │   └── Scaffold
    │       ├── AppBar ("Primeira Página")
    │       └── Body
    │           └── ElevatedButton → Navigator.pushNamed('/segunda')
    └── '/segunda' → SegundaPagina
        └── Scaffold
            ├── AppBar ("Segunda Página")
            └── Body
                └── ElevatedButton → Navigator.pop()
```