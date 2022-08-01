
import 'package:demo_travels/src/data/global_preferences.dart';
import 'package:demo_travels/src/widgets/alerts/simple_alert.dart';
import 'package:demo_travels/src/widgets/alerts/snackbar_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;


class LoginController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();
  final TextEditingController _emailCtrl     = TextEditingController();
  final TextEditingController _passWordCtrl  = TextEditingController();
  final GlobalKey<FormState> _loginFormkey   = GlobalKey<FormState>();
  bool _hidePass = true;

  //? GETTERS
  TextEditingController get gxEmailCtrl    => _emailCtrl;
  TextEditingController get gxPassWordCtrl => _passWordCtrl;
  GlobalKey<FormState> get gxloginFormKey  => _loginFormkey;
  bool get gxHidePass                      => _hidePass;

  @override
  void onInit() {
    // TODO: implement onInit
    print(_globalPreferences.userEmail);
  }

  @override
  void onClose() {
    _emailCtrl.dispose();
    _passWordCtrl.dispose();
    super.onClose();
  }

  //==========================================================
  /// OCULTA Y MUESTRA LA CONTRASEÑA DEL CAMPO PASSWORD
  //==========================================================
  void fnHidePass() {
    _hidePass = !_hidePass;
    update(['form']);
  }

  //==========================================================
  /// INICIO DE SESIÓN CON FIREBASE
  //==========================================================
  Future<void> fnLogin() async{
    
    final bool _isValidForm = _loginFormkey.currentState!.validate();
    
    utils.msginfo('Iniciando Sesión...');

    if(_isValidForm) {

      if(_emailCtrl.text.trim() != _globalPreferences.userEmail && !_globalPreferences.isFisrtLogin) {
        print('--> No es primer login');
        SimpleAlert().cAlert('Upss!!!', 'Correo electrónico incorrecto.\n\nPor favor verifica tus datos');
      }else {
        // Get.offAllNamed('/home_page');
        print('--> Primer login');
        _globalPreferences.userEmail = _emailCtrl.text.trim();
        Get.offAllNamed('/home_page');
      }
      
      // print('--> Primer login');
      // _globalPreferences.userEmail = _emailCtrl.text.trim();
      // Get.offAllNamed('/home_page');
      
    } else {
      SnackBarAlert.cSnackBar(Icons.warning, 'Formulario invalido');
    }
  }
  
}