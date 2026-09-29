# Lista de Compras - Atividade 2

Aplicação desenvolvida em Flutter para prática de conceitos fundamentais de interface, incluindo construção dinâmica de listas com `ListView.builder`, uso de `CheckboxListTile`, gerenciamento de estado com `StatefulWidget` e modelagem de dados com classes.

## Requisitos da Atividade

1. **Customização de tema**
   * Configuração do `ThemeData` com `ColorScheme.fromSeed`.
   * Suporte ao Material 3 habilitado.
   * Remoção do banner de debug (`debugShowCheckedModeBanner: false`).

2. **Barra superior (`AppBar`)**
   * Título centralizado (`centerTitle`).
   * Elemento no canto esquerdo (`leading`) com as iniciais do usuário em um `CircleAvatar`.
   * Ícone de carrinho no canto direito (`actions`).

3. **Modelagem de dados**
   * Classe `Item` com os atributos `nome` (`String`) e `chek` (`bool`), compatível com null safety.

4. **Lista dinâmica (`ListView.builder`)**
   * Itens gerados a partir de uma lista de objetos `Item`.
   * Cada item exibido com um `CheckboxListTile`.

5. **Gerenciamento de estado**
   * Uso de `StatefulWidget` e `setState` para marcar e desmarcar os itens da lista.

6. **Melhorias visuais**
   * Cabeçalho com contador de itens marcados e barra de progresso (`LinearProgressIndicator`).
   * Itens em `Card` com cantos arredondados.
   * Itens marcados exibidos com texto riscado e ícone de confirmação.

## Tecnologias Utilizadas

* Flutter (SDK)
* Dart
* Material Design 3

## Pré-requisitos

* [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado
* Emulador ou dispositivo físico disponível

## Como Executar

1. Clone o repositório e acesse a pasta do projeto:

   ```bash
   cd atividade_2
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:

   ```bash
   flutter run
   ```

## Estrutura do App

```
Scaffold
├── AppBar ("Home")
│   ├── Leading (CircleAvatar "OP")
│   └── Actions (Icon local_grocery_store)
└── Body
    └── Column
        ├── Container (Cabeçalho)
        │   ├── Text ("Lista de Compras")
        │   ├── Text (Contador de itens marcados)
        │   └── LinearProgressIndicator
        └── ListView.builder
            └── Card
                └── CheckboxListTile (Item: nome + chek)
```