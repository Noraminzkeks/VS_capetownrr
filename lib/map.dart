import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapClass extends StatefulWidget {
  const MapClass({Key? key}) : super(key: key);

  @override
  State<MapClass> createState() => _MapClassState();
}

class _MapClassState extends State<MapClass> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // Anpassen der Größe
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenSize = Size(
          constraints.minHeight,
          constraints.minWidth,
        );

        //Festlegen des Ausschnitts mit Koordinaten
        return FlutterMap(
          options: MapOptions(
            center: LatLng(-34, 18.5),
            zoom: 10,
          ),

          // Ausschnitt der Karte angepasst an die Bildschirmgröße
          nonRotatedChildren: [
            Positioned(
              top: screenSize.height * 0.1, // 10% der Bildschirmhöhe
              left: screenSize.width * 0.2, // 20% der Bildschirmbreite
              child: SizedBox(
                width: screenSize.width * 0.6, // 60% der Bildschirmbreite
                height: screenSize.height * 0.3, // 30% der Bildschirmhöhe
              ),
            ),
          ],

          //URL um Kachel zu erstellen
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ],
        );
      },
    );
  }
}