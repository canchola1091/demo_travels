
import 'package:demo_travels/src/data/global_preferences.dart';
import 'package:get/get.dart';
// import 'package:demo_travels/src/theme/theme.dart' as th;
// import 'package:demo_travels/src/utils/utils.dart' as utils;

class HomeController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();
  int _selectedIndex = 0;

  //? GETTERS
  int get gSelectedIndex => _selectedIndex;

   @override
  void onInit() {
    super.onInit();
    _globalPreferences.isFisrtLogin = false;
    print('--> Email: ${_globalPreferences.userEmail}');
  }

  //==========================================================
  /// ACTUALIZA LA VISTA DEPENDIENTO DEL ITEM SELECCIONADO
  //==========================================================
  void onItemTapped(int _idx) {
    _selectedIndex = _idx;
    update(['bottom_nav_menu']);
  }

}