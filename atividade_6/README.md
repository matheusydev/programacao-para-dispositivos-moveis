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

Ative no Google Cloud a API da plataforma em que vai executar o app. Os arquivos locais da tabela são ignorados pelo Git.

| Plataforma | Configuração local | API no Google Cloud |
|---|---|---|
| Android | Defina a variável de ambiente `MAPS_API_KEY` ou adicione `MAPS_API_KEY=SUA_CHAVE` a `android/local.properties`. | Maps SDK for Android |
| Web | Copie `web/maps_config.example.js` para `web/maps_config.js` e substitua `COLOQUE_SUA_CHAVE_AQUI`. | Maps JavaScript API |
| iOS | Crie `ios/Flutter/MapsSecrets.xcconfig` com `MAPS_API_KEY = SUA_CHAVE`. | Maps SDK for iOS |

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