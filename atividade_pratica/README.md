# Atividade prática — Discovery

Aplicativo Flutter de descoberta de lugares com Google Maps.

## Configuração da API

Ative no Google Cloud a API da plataforma em que vai executar o app. Os arquivos locais da tabela são ignorados pelo Git.

| Plataforma | Configuração local | API no Google Cloud |
|---|---|---|
| Android | Defina a variável de ambiente `MAPS_API_KEY` ou adicione `MAPS_API_KEY=SUA_CHAVE` a `android/local.properties`. | Maps SDK for Android |
| Web | Copie `web/maps_config.example.js` para `web/maps_config.js` e substitua `COLOQUE_SUA_CHAVE_AQUI`. | Maps JavaScript API |

## Como executar

A partir da raiz do repositório:

```bash
cd atividade_pratica
flutter pub get
flutter run -d chrome
```

Para Android, execute `flutter run` com um emulador ou dispositivo conectado.
