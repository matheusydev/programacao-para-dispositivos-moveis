# Atividade 7 — Mapa com Ícone Personalizado

Aplicativo Flutter que mostra um mapa de Teresina com marcadores que usam uma **imagem própria** no lugar do alfinete vermelho padrão do Google Maps.

Desenvolvido para a disciplina **Programação para Dispositivos Móveis**, ministrada pelo professor **Otílio Paulo**.

É uma versão mais simples da [atividade 6](../atividade_6/): o foco aqui é só a troca do ícone do marcador.

## Como funciona

O app abre o mapa centralizado em Teresina com três marcadores:

- Ponte Estaiada
- Encontro dos Rios
- Parque da Cidadania

Cada marcador aparece como um círculo verde com uma câmera fotográfica. Ao tocar nele, aparece o balão com o nome e uma descrição curta do lugar.

## Como o ícone foi trocado

1. A imagem `marcador.png` foi colocada na pasta `assets/`.
2. A imagem foi registrada no `pubspec.yaml`:

   ```yaml
   flutter:
     assets:
       - assets/marcador.png
   ```

3. No `initState`, a imagem é carregada com `BitmapDescriptor.asset`:

   ```dart
   final BitmapDescriptor icone = await BitmapDescriptor.asset(
     const ImageConfiguration(size: Size(48, 48)),
     'assets/marcador.png',
   );
   ```

4. O ícone carregado é passado no parâmetro `icon` de cada `Marker`:

   ```dart
   Marker(
     markerId: MarkerId(ponto.nome),
     position: ponto.posicao,
     icon: icone,
     anchor: const Offset(0.5, 0.5),
   )
   ```

Como o carregamento da imagem é assíncrono, os marcadores começam como um conjunto vazio e são preenchidos com `setState` assim que o ícone fica pronto.

O `anchor: Offset(0.5, 0.5)` faz o centro da imagem ficar em cima da coordenada. Sem ele, o ponto de referência seria a parte de baixo da imagem, que é o certo para alfinetes, mas não para um ícone redondo.

Para usar outro ícone, basta trocar o arquivo `assets/marcador.png` por outra imagem PNG (de preferência quadrada e com fundo transparente).

## Estrutura do código

```
assets/
└── marcador.png   # imagem usada nos marcadores
lib/
└── main.dart      # lista de lugares, carregamento do ícone e tela com o mapa
```

## Conceitos utilizados

- `GoogleMap`, `CameraPosition` e `LatLng`
- `Marker` com o parâmetro `icon`
- `BitmapDescriptor.asset` e `ImageConfiguration` para carregar a imagem
- `anchor` para posicionar a imagem em relação à coordenada
- Assets declarados no `pubspec.yaml`
- `initState`, `async`/`await` e `setState`
- Records do Dart 3 para guardar nome, descrição e posição de cada lugar

## Configuração da API

A chave de API do Google Maps é a mesma da atividade 6 e está configurada nos mesmos arquivos:

| Plataforma | Arquivo |
|---|---|
| Android | `android/app/src/main/AndroidManifest.xml` |
| iOS | `ios/Runner/AppDelegate.swift` |
| Web | `web/index.html` |

## Como executar

```bash
flutter pub get
flutter run -d chrome
```

Assim como na atividade 6, o `google_maps_flutter` funciona no **Android**, no **iOS** e na **Web**, mas **não funciona no Windows**.

## Autor

Matheus Ylan Araujo Moraes — Matrícula 2025111TADS0039
