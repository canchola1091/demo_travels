
import 'dart:convert';

import 'package:demo_travels/src/data/global_preferences.dart';
import 'package:demo_travels/src/widgets/alerts/alert_logout.dart';
import 'package:demo_travels/src/widgets/alerts/simple_alert.dart';
import 'package:demo_travels/src/widgets/alerts/snack_notification.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:demo_travels/src/utils/utils.dart' as utils;

class SettingsController extends GetxController {

final GlobalPreferences _globalPreferences = GlobalPreferences();
final String _keyServer = 'AAAAkR-vuF8:APA91bEu2vbwj2mJ9P7vAnX-ZPZ9wAVoqDouKwlQhmBPyK2_2-zjmaU_7uJSAs0pJXXTpTH1sLkSxSHtW626ZaK1fuBw5gs5awNGRHG9Alyn67KIqPFz4V-PNR5JW-soL5CaUpfihYk3';

  void showAlertLogOut() {
    Get.dialog(
      AlertLogOut(
        fnDone: _shotLogountNotification,
        fnCancel: () => Get.back()
      ),
      barrierDismissible: false
    );
  }

  Future<void> _shotLogountNotification() async{
    const String _title = "Te extrañaremos";
    const String _bodyMessage = "Vuelva pronto, estamos mejorando la experiencia de viajar y conocer lugares";
    utils.msginfo('--> Disparando Notificación de LogOut');
    final Map<String, dynamic> _mapBody = {
      "to": _globalPreferences.tokenDevice,
      "to1": "/topics/weather",
      "priority" : "high",
      "notification" : {
        "title" : _title,
        "body" : _bodyMessage,
        "vibrate" : 1,
        "sound": "default"
      }
    };
    final _url = Uri.tryParse('https://fcm.googleapis.com/fcm/send');
    try {
      final _resp = await http.post(
        _url!,
        headers: utils.authorization(_keyServer),
        body: jsonEncode(_mapBody)
      );
      // print('--> Resp: ${_resp.body}');
      // print('--> Status: ${_resp.statusCode}');
      if(_resp.statusCode == 200) {
        Get.offAllNamed('/login_page');
        SnackNotification.snackNoti(_title, _bodyMessage);
      }else {
        SimpleAlert().cAlert('Upss!!', 'Ocurrio un error al cerrar la sesión');
        utils.msgerror('Ocurrio un error al cerrar la sesión');
      }
    } catch (e) {
      utils.msgerror('--> CATCH: $e');
    }
  }

}