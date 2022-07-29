
import 'package:demo_travels/src/widgets/alerts/alert_logout.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  void showAlertLogOut() {
    Get.dialog(
      AlertLogOut(
        fnDone: () => Get.offAllNamed('/login_page'), 
        fnCancel: () => Get.back()
      ),
      barrierDismissible: false
    );
  }
  
}