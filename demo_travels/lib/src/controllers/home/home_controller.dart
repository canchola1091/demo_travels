
import 'package:get/get.dart';
// import 'package:demo_travels/src/theme/theme.dart' as th;
// import 'package:demo_travels/src/utils/utils.dart' as utils;

class HomeController extends GetxController {

  int _selectedIndex = 0;

  //? GETTERS
  int get gSelectedIndex => _selectedIndex;

  //==========================================================
  /// ACTUALIZA LA VISTA DEPENDIENTO DEL ITEM SELECCIONADO
  //==========================================================
  void onItemTapped(int _idx) {
    _selectedIndex = _idx;
    update(['bottom_nav_menu']);
  }

}