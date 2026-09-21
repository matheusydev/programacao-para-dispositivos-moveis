# Banco App - Atividade 1

Aplicação desenvolvida em Flutter para prática de conceitos fundamentais de interface, incluindo customização de tema, navegação lateral com `Drawer` e estruturação de layouts em lista.

---

## Requisitos da Atividade

1. **Customização de tema**
   - Configuração do `ThemeData` com `ColorScheme.fromSeed`.
   - Suporte ao Material 3 habilitado.

2. **Menu lateral (`Drawer`)**
   - Cabeçalho personalizado (`DrawerHeader`) com foto de perfil (`CircleAvatar`), nome e e-mail do usuário.
   - Opções de navegação rápida: Saldo, Extrato e Pagamentos.

3. **Estruturação com lista (`ListView`)**
   - Corpo do aplicativo (`body`) composto por uma `ListView` com itens de opção e informação (`ListTile`).

---

## Tecnologias Utilizadas

- Flutter (SDK)
- Dart
- Material Design 3

---

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado
- Emulador ou dispositivo físico disponível

---

## Como Executar

1. Clone o repositório e acesse a pasta do projeto:

```bash
   cd atividade_1
```

2. Instale as dependências:

```bash
   flutter pub get
```

3. Execute o aplicativo:

```bash
   flutter run
```

---

## Estrutura do App

```text
Scaffold
├── AppBar ("Meu Banco")
├── Drawer
│   ├── DrawerHeader (CircleAvatar + Nome + E-mail)
│   ├── ListTile (Saldo)
│   ├── ListTile (Extrato)
│   └── ListTile (Pagamentos)
└── Body
    └── ListView
        ├── ListTile (Saldo - R$ 1.500,00)
        ├── ListTile (Extrato)
        └── ListTile (Pagamentos)
```