import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/places.dart';

class NearbyPage extends StatefulWidget {
  final List<Place> places;

  final Place? initialPlace;

  final String title;

  const NearbyPage({
    super.key,
    required this.places,
    this.initialPlace,
    this.title = 'Nearby',
  });

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  static const _initialCamera = CameraPosition(
    target: LatLng(-5.0910, -42.8132),
    zoom: 16,
  );

  static const _selectedColor = Color(0xFFFFE082);

  GoogleMapController? _mapController;
  Place? _selected;

  @override
  void initState() {
    super.initState();
    final place = widget.initialPlace;
    if (place != null) {
      _selected = place;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _showPlaceDetails(place);
      });
    }
  }

  CameraPosition get _startCamera {
    final place = widget.initialPlace;
    if (place == null) return _initialCamera;
    return CameraPosition(target: LatLng(place.lat, place.lng), zoom: 17);
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Set<Marker> get _markers => {
    for (final place in widget.places)
      Marker(
        markerId: MarkerId(place.name),
        position: LatLng(place.lat, place.lng),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          identical(place, _selected)
              ? BitmapDescriptor.hueYellow
              : BitmapDescriptor.hueRed,
        ),
        infoWindow: InfoWindow(title: place.name, snippet: place.address),
        onTap: () => _selectPlace(place),
      ),
  };

  void _selectPlace(Place place) {
    setState(() => _selected = place);

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(place.lat, place.lng), 17),
    );

    _showPlaceDetails(place);
  }

  void _showPlaceDetails(Place place) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.star, color: Color(0xFFFFC107), size: 20),
                  const SizedBox(width: 4),
                  Text(
                    place.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _InfoRow(icon: Icons.location_on_outlined, text: place.address),
              _InfoRow(icon: Icons.access_time, text: place.hours),
              _InfoRow(
                icon: Icons.my_location,
                text:
                    '${place.lat.toStringAsFixed(4)}, '
                    '${place.lng.toStringAsFixed(4)}',
              ),
              const SizedBox(height: 8),
              Text(place.description, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _startCamera,
            zoomControlsEnabled: false,
            markers: _markers,
            padding: const EdgeInsets.only(bottom: 110),
            onMapCreated: (controller) => _mapController = controller,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: widget.places.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final place = widget.places[index];
                    return _PlaceChip(
                      place: place,
                      selected: identical(place, _selected),
                      selectedColor: _selectedColor,
                      onTap: () => _selectPlace(place),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}

class _PlaceChip extends StatelessWidget {
  final Place place;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;

  const _PlaceChip({
    required this.place,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? selectedColor : Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 220,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                place.address,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
