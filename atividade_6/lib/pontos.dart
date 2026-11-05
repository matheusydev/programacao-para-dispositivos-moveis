import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ponto_turistico.dart';

const List<PontoTuristico> pontosTuristicos = [
  PontoTuristico(
    nome: 'Ponte Estaiada',
    descricao: 'Um dos principais cartões-postais de Teresina, '
        'com vista panorâmica da cidade.',
    posicao: LatLng(-5.0795, -42.7940),
  ),
  PontoTuristico(
    nome: 'Encontro dos Rios',
    descricao: 'Local onde os rios Parnaíba e Poti se encontram, '
        'formando uma paisagem natural característica da região.',
    posicao: LatLng(-5.0850, -42.8110),
  ),
  PontoTuristico(
    nome: 'Parque da Cidadania',
    descricao: 'Espaço público de lazer, cultura e convivência, '
        'com áreas verdes e espaços para atividades físicas.',
    posicao: LatLng(-5.0855, -42.8130),
  ),
  PontoTuristico(
    nome: 'Mercado do Troca-Troca',
    descricao: 'Mercado tradicional de Teresina, conhecido pelo '
        'comércio popular e pela variedade de produtos.',
    posicao: LatLng(-5.0880, -42.8130),
  ),
  PontoTuristico(
    nome: 'IFPI Campus Teresina Central',
    descricao: 'Instituto Federal do Piauí, instituição pública '
        'de ensino, pesquisa e extensão.',
    posicao: LatLng(-5.0892, -42.8016),
  ),
];