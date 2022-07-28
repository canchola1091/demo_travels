
import 'package:demo_travels/src/widgets/alerts/simple_alert.dart';
import 'package:demo_travels/src/widgets/alerts/snackbar_alert.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;


class LoginController extends GetxController {

  final TextEditingController _emailCtrl    = TextEditingController();
  final TextEditingController _passWordCtrl = TextEditingController();
  final GlobalKey<FormState> _loginFormkey  = GlobalKey<FormState>();
  bool _hidePass = true;

  //? GETTERS
  TextEditingController get gxEmailCtrl    => _emailCtrl;
  TextEditingController get gxPassWordCtrl => _passWordCtrl;
  GlobalKey<FormState> get gxloginFormKey  => _loginFormkey;
  bool get gxHidePass => _hidePass;

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
    // if(_isValidForm) { // TODO: Agregar logica
      utils.msginfo('Iniciando Sesión...');
      Get.offAllNamed('/home_page');
    // } else {
    //   SnackBarAlert.cSnackBar(Icons.warning, 'Formulario invalido');
    // }
  }
  
}