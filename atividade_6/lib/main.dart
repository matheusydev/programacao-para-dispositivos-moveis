import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        initialCameraPosition: const CameraPosition(
          target: _centro,
          zoom: 14,
        ),
      ),
    );
  }
}