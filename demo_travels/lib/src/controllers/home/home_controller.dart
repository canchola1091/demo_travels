
import 'package:get/get.dart';

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