import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ponto_turistico.dart';

const List<PontoTuristico> pontosTuristicos = [
  PontoTuristico(
    nome: 'Ponte Estaiada',
    descricao: 'Um dos principais cartões-postais de Teresina, '
        'com vista panorâmica da cidade.',
    posicao: LatLng(-5.070318, -42.803281),
  ),
  PontoTuristico(
    nome: 'Encontro dos Rios',
    descricao: 'Local onde os rios Parnaíba e Poti se encontram, '
        'formando uma paisagem natural característica da região.',
    posicao: LatLng(-5.03565, -42.83882),
  ),
  PontoTuristico(
    nome: 'Parque da Cidadania',
    descricao: 'Espaço público de lazer, cultura e convivência, '
        'com áreas verdes e espaços para atividades físicas.',
    posicao: LatLng(-5.080788, -42.805516),
  ),
  PontoTuristico(
    nome: 'Mercado do Troca-Troca',
    descricao: 'Mercado tradicional de Teresina, conhecido pelo '
        'comércio popular e pela variedade de produtos.',
    posicao: LatLng(-5.09241, -42.81891),
  ),
  PontoTuristico(
    nome: 'IFPI Campus Teresina Central',
    descricao: 'Instituto Federal do Piauí, instituição pública '
        'de ensino, pesquisa e extensão.',
    posicao: LatLng(-5.0887585, -42.8107683),
  ),
];
