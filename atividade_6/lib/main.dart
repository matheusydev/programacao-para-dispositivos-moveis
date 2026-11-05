import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'pontos.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaMapa(),
  ));
}

class TelaMapa extends StatefulWidget {
  const TelaMapa({super.key});

  @override
  State<TelaMapa> createState() => _TelaMapaState();
}

class _TelaMapaState extends State<TelaMapa> {
  late GoogleMapController mapController;

  static const LatLng _centro = LatLng(-5.0892, -42.8016);

  final Set<Marker> _marcadores = pontosTuristicos
      .map((ponto) => Marker(
            markerId: MarkerId(ponto.nome),
            position: ponto.posicao,
            infoWindow: InfoWindow(
              title: ponto.nome,
              snippet: ponto.descricao,
            ),
          ))
      .toSet();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _marcadores,
        initialCameraPosition: const CameraPosition(
          target: _centro,
          zoom: 14,
        ),
      ),
    );
  }
}
