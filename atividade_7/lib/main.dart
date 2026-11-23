import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaMapa(),
  ));
}

// Lugares que vão aparecer no mapa (nome, descrição e posição).
const pontos = [
  (
    nome: 'Ponte Estaiada',
    descricao: 'Cartão-postal de Teresina.',
    posicao: LatLng(-5.070318, -42.803281),
  ),
  (
    nome: 'Encontro dos Rios',
    descricao: 'Onde os rios Parnaíba e Poti se encontram.',
    posicao: LatLng(-5.03565, -42.83882),
  ),
  (
    nome: 'Parque da Cidadania',
    descricao: 'Espaço de lazer, cultura e esporte.',
    posicao: LatLng(-5.080788, -42.805516),
  ),
];

class TelaMapa extends StatefulWidget {
  const TelaMapa({super.key});

  @override
  State<TelaMapa> createState() => _TelaMapaState();
}

class _TelaMapaState extends State<TelaMapa> {
  static const LatLng _centro = LatLng(-5.064, -42.821);

  // Começa vazio e é preenchido depois que o ícone for carregado.
  Set<Marker> _marcadores = {};

  @override
  void initState() {
    super.initState();
    _carregarMarcadores();
  }

  Future<void> _carregarMarcadores() async {
    // Carrega a imagem da pasta assets para usar no lugar do alfinete vermelho.
    final BitmapDescriptor icone = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/marcador.png',
    );

    if (!mounted) return;

    setState(() {
      _marcadores = pontos
          .map((ponto) => Marker(
                markerId: MarkerId(ponto.nome),
                position: ponto.posicao,
                icon: icone, // <- aqui o ícone é trocado
                anchor: const Offset(0.5, 0.5), // centro da imagem no ponto
                infoWindow: InfoWindow(
                  title: ponto.nome,
                  snippet: ponto.descricao,
                ),
              ))
          .toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa com Ícone Personalizado'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: GoogleMap(
        markers: _marcadores,
        initialCameraPosition: const CameraPosition(
          target: _centro,
          zoom: 13,
        ),
      ),
    );
  }
}
