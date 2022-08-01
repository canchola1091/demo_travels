
import 'package:demo_travels/src/controllers/destinos/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapDestino extends StatelessWidget {

  final double latitude;
  final double longitude;

  const MapDestino({
    Key? key,
    required this.latitude,
    required this.longitude
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Set<Marker> markers = {};

    markers.add(Marker(
      markerId: MarkerId('$latitude$latitude'),
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarker,
    ));

    return GetBuilder<MapController>(
      init: MapController(),
      id: 'map-destino',
      builder: (_) => GoogleMap(
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: _.setCoodinates(latitude, longitude),
        onMapCreated: (GoogleMapController controller) {
          _.gxMapCtrl.complete(controller);
        }
      ),
    );
  }

  
}