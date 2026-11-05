# Atividade 6 — Guia Turístico de Teresina com Google Maps

Aplicativo Flutter que exibe um mapa de Teresina com marcadores nos principais pontos turísticos da cidade, usando a API do Google Maps.

Desenvolvido para a disciplina **Programação para Dispositivos Móveis**, ministrada pelo professor **Otílio Paulo**.

## Como funciona

O app abre um mapa centralizado em Teresina, com marcadores em cinco lugares:

- Ponte Estaiada
- Encontro dos Rios
- Parque da Cidadania
- Mercado do Troca-Troca
- IFPI Campus Teresina Central

Ao tocar em um marcador, aparece um balão com o nome e uma breve descrição do lugar.

## Configuração da API

A chave de API foi criada no [Google Cloud Console](https://console.cloud.google.com/), com três APIs ativadas:

- Maps SDK for Android
- Maps SDK for iOS
- Maps JavaScript API

A chave está restrita a essas três APIs e foi adicionada em cada plataforma:

| Plataforma | Arquivo | Como a chave é informada |
|---|---|---|
| Android | `android/app/src/main/AndroidManifest.xml` | `<meta-data>` dentro de `<application>` |
| iOS | `ios/Runner/AppDelegate.swift` | `GMSServices.provideAPIKey(...)` antes de iniciar o Flutter |
| Web | `web/index.html` | Script do Google Maps no `<head>` |

O slide da aula mostra o `AppDelegate.m` em Objective-C. Como os projetos Flutter atuais usam Swift, a configuração do iOS foi feita no `AppDelegate.swift`.

## Estrutura do código

```
lib/
├── ponto_turistico.dart   # modelo PontoTuristico: nome, descrição e posição
├── pontos.dart            # lista dos pontos turísticos de Teresina
└── main.dart              # tela com o mapa e os marcadores
```

## Conceitos utilizados

- `GoogleMap` com `initialCameraPosition` e `CameraPosition`
- `GoogleMapController` recebido pelo `onMapCreated`
- `LatLng` para representar coordenadas
- `Marker` e `InfoWindow` para os marcadores e os balões
- Conversão de uma lista de objetos em `Set<Marker>` com `.map()` e `.toSet()`
- Classe modelo com campos `final` e construtor `const`
- `late` e null safety do Dart 3

## Como executar

```bash
flutter pub get
flutter run -d chrome
```

O `google_maps_flutter` funciona no **Android**, no **iOS** e na **Web**, mas **não funciona no Windows**. Por isso, o projeto foi testado no Chrome.

## Autor

Matheus Ylan Araujo Moraes — Matrícula 2025111TADS0039