import 'package:google_maps_flutter/google_maps_flutter.dart';

class PontoTuristico {
  final String nome;
  final String descricao;
  final LatLng posicao;

  const PontoTuristico({
    required this.nome,
    required this.descricao,
    required this.posicao,
  });
}