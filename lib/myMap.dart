import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_about_me/config.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late GoogleMapController mapController;

  final LatLng center = Config.profileData["mapLatLng"];

  void onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('แผนที่ของฉัน'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: onMapCreated,
                initialCameraPosition: CameraPosition(target: center, zoom: 16.0),
                markers: {
                  Marker(
                    markerId: const MarkerId('Home'),
                    position: center
                  )
                },
              ),
            )
          )
        ],
      ),
    );
  }
}