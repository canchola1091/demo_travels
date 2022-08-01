

import 'package:get/get_state_manager/get_state_manager.dart';

class DestinosController extends GetxController {

  bool _viewMap = false;

  //? GETTERS
  bool get gxViewMap => _viewMap;

  //* SETTERS
  void setViewMap(bool value) {
    _viewMap = value;
    update(['map-destino']);
  }
  
}