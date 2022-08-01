
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;

class SnackNotification {
  
  static void snackNoti(String title, String message) {

    Get.snackbar(
      title,
      message,
      maxWidth: utils.porcientoW(Get.context, 87.0),
      titleText: const SizedBox.shrink(),
      isDismissible: true,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      icon: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.flutter_dash,
          color: Colors.white,
      )
    ),
      backgroundColor: th.primaryColor.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(milliseconds: 10000),
      borderRadius: 10.0,
    );
  }

}