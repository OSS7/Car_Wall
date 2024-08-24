import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/constant/colors.dart';

class CarDetailsDetailsSectionMap extends StatelessWidget {
  const CarDetailsDetailsSectionMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Car\'s Location',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(36.1767826, 44.0072916),
                  initialZoom: 17.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng(36.1767826, 44.0072916),
                        width: 80,
                        height: 80,
                        child: Icon(Icons.location_on, color: cPrimary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
