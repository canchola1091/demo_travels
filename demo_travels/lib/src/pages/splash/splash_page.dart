

import 'package:demo_travels/src/controllers/splash/splash_controller.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: -0.6,
                child: Icon(
                  Icons.airplanemode_active_sharp,
                  size: utils.porcientoH(Get.context, 27.0),
                  color: th.iconColor
                ),
              ),
              SizedBox(height: utils.porcientoH(Get.context, 8.0)),
              const CustomText(
                fTxt: 'Xperiences',
                fSize: 25.0,
                fWeight: 'Bold',
              ),
              const SizedBox(height: 30.0),
              const CustomText(
                fTxt: 'Disfruta una aventura de viaje',
                fSize: 17.0,
              )
            ]
          )
        )
      )
    );
  }
}