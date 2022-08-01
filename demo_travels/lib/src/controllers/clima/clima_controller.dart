
import 'package:demo_travels/src/models/clima_model.dart';
import 'package:demo_travels/src/services/clima_services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Climacontroller extends GetxController {

  late double _latitude;
  late double _longitude;
  String _address = '';
  String _country = '';
  bool _locationLoaded = false;
  late ClimaModel? _climaModel;
  bool _loadingClima = true;
  bool _hasError = false;

  //? GETTERS
  String get gxAddress         => _address;
  String get gxCountry         => _country;
  ClimaModel? get gxClimaModel => _climaModel;
  bool get gxLocationLoaded    => _locationLoaded;
  bool get gxLoadingClima      => _loadingClima;
   
  //****************ESTADOS*******************
  @override
  void onInit() {
    super.onInit();
    // _handlerLocationService();
  }

  @override
  void onReady() {
    super.onReady();
    _handlerLocationService();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  //*****************************************

  // TODO: Agregar descripción
  Future<void> _handlerLocationService() async {
    
    late bool _serviceEnabled;
    late LocationPermission _permission;

    _serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!_serviceEnabled) {
      await Geolocator.openLocationSettings();
      print('--> 😨 La ubicación está desactivada');
      // return Future.error('La ubicación está desactivada');
    }

    _permission = await Geolocator.checkPermission();

    if(_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
      if(_permission == LocationPermission.denied) {
        print('--> 😡 Los permisos de ubicación fueron denegados');
        return Future.error('Los permisos de ubicación fueron denegados');
      }
    }

    if(_permission == LocationPermission.deniedForever) {
      print('--> ❌ Los permisos de ubicación fueron denegados permanetemente');
      return Future.error('Los permisos de ubicación fueron denegados permanetemente');
    }

    _getLocation();

  }

  Future<void> _getLocation() async {
    Position _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _latitude = _position.latitude;
    _longitude = _position.longitude;
    await _getAddressFromLatLong(_position);
    _locationLoaded = true;
    if(_locationLoaded) gxGetClima();
    print('--> Latitud: $_latitude');
    print('--> Longitud: $_longitude');
  }

  // TODO: Agregar descripción
  Future<void> _getAddressFromLatLong(Position position) async {
    final List<Placemark> _placeMark = await placemarkFromCoordinates(position.latitude, position.longitude);

    _address = '${_placeMark[0].subLocality} ,${_placeMark[0].locality}';
    _country = '${_placeMark[0].locality}';
    print('--> Dirección $_address');
  }

  //==========================================================
  /// CONSUME ENDPOINT PARA OBTENER EL CLIMA
  //==========================================================
  Future<void> gxGetClima() async {
    _climaModel = await ClimaServices().serviceGetClima(_latitude.toString(), _longitude.toString());    
    if(_climaModel == null) _hasError = true;
    _loadingClima = false;
    update(['body-clima']);

  }

}