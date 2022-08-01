
import 'dart:async';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {

  final Completer<GoogleMapController> _mapCtrl = Completer();

  //? GETTERS
  Completer<GoogleMapController> get gxMapCtrl => _mapCtrl;

  CameraPosition setCoodinates(double latitude, double longitude) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.0,
    );
  }


}