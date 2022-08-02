

import 'package:card_swiper/card_swiper.dart';
import 'package:demo_travels/src/controllers/clima/clima_controller.dart';
import 'package:demo_travels/src/pages/destinos/detail_destino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class DestinosController extends GetxController {

  final Climacontroller _climacontroller   = Get.find<Climacontroller>();
  final SwiperController _swiperController = SwiperController();
  bool _viewMap          = false;
  String _addressDestino = '';
  String _countryDestino = '';

  //? GETTERS
  Climacontroller get gxClimaCtrl   => _climacontroller;
  SwiperController get gxSwiperCtrl => _swiperController;
  bool get gxViewMap           => _viewMap;
  String get gxAddressdDestino => _addressDestino;
  String get gxCountryDestino  => _countryDestino;

  //* SETTERS
  void setViewMap(bool value) {
    _viewMap = value;
    update(['map-destino']);
  }

  //==========================================================
  /// OBTIENE LA DIRECCIÓN CON LAS COORDENADAS (LAT, LONG)
  /// Y NAVEGA HACIA LA VISTA DE DETALLE DESTINO
  //==========================================================
  Future<void> getAddressFromLatLong(double latitude, double longitude, int index) async {
    final List<Placemark> _placeMarkDestino = await placemarkFromCoordinates(latitude, longitude);

    _addressDestino = '${_placeMarkDestino[0].subLocality} ,${_placeMarkDestino[0].locality}';
    _countryDestino = '${_placeMarkDestino[0].locality}';
    // print('--> Dirección $_addressDestino');
    // print('--> Country $_countryDestino');

    Get.to( () => DetailDestinoPage(index: index));
  }

}