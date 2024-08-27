import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../constant/colors.dart';

class CustomMap extends StatefulWidget {
  final Function(MapCamera, bool)? onChange;
  final LatLng? location;
  const CustomMap({super.key, this.onChange, this.location});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  MapController mapController = MapController();
  LatLng _selectedLocation =
      const LatLng(36.191712543630416, 44.00969088752672);
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: widget.location ?? _selectedLocation,
        initialZoom: 15,
        onPositionChanged: widget.onChange,
      ),
      children: [
        TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
        MarkerLayer(
          markers: [
            Marker(
              rotate: true,
              point: widget.location ?? _selectedLocation,
              width: 80,
              height: 80,
              child: Icon(Icons.location_on, color: cPrimary, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}
