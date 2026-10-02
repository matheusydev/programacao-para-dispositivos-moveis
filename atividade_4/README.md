# Atividade 4 — Gasolina x Álcool

Aplicativo Flutter que indica qual combustível compensa mais na hora de abastecer.

Desenvolvido para a disciplina **Programação para Dispositivos Móveis**, ministrada pelo professor Otílio Paulo.

## Como funciona

O usuário informa o preço da gasolina e do álcool e toca em **Calcular**. O app faz a conta:

```
(valor do álcool / valor da gasolina) * 100
```

- Abaixo de 70%: **abasteça com álcool**
- 70% ou mais: **abasteça com gasolina**

O resultado só aparece depois que o botão é pressionado.

> O enunciado original indicava a regra invertida. Como o álcool rende cerca de 30% menos por litro, ele só compensa quando custa menos de 70% do preço da gasolina, então a condição foi ajustada.

## Conceitos utilizados

- `TextField` com `TextEditingController` para ler os valores digitados
- `InputDecoration` com rótulo, prefixo "R$" e ícone para cada combustível
- `Container` e `AnimatedContainer` com `BoxDecoration` para destacar a imagem e o resultado
- `StatefulWidget` e `setState` para atualizar a tela após o cálculo
- `Image.network` para carregar a imagem da internet

## Capturas de tela

<!-- Coloque os prints na pasta screenshots/ e ajuste os nomes abaixo -->
| Tela inicial | Álcool | Gasolina |
|---|---|---|
| ![Tela inicial](screenshots/inicial.png) | ![Resultado álcool](screenshots/alcool.png) | ![Resultado gasolina](screenshots/gasolina.png) |

## Como executar

```bash
flutter pub get
flutter run
```

## Autor

Matheus Ylan Araujo Moraes — Matrícula 2025111TADS0039