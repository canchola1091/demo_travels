
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:get/get.dart';


class CardIconClima extends StatelessWidget {
  const CardIconClima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: utils.porcientoW(Get.context, 22.0)),
      clipBehavior: Clip.antiAlias,
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'http://openweathermap.org/img/wn/04d@2x.png',
            height: utils.porcientoW(Get.context, 26.0)
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 7.0),
            child: CustomText(
              fTxt: '25º C', 
              fSize: 20.0,
              fColor: Colors.black,
              fWeight: 'Bold',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, bottom: 7.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.pin_drop, size: 25.0, color: th.primaryColor),
                CustomText(
                fTxt: 'Querétaro Centro,\nMéxico', 
                fSize: 14.0,
                fColor: Colors.black.withOpacity(0.5),
                fWeight: 'Bold',
                )
              ]
            )
          )
        ]
      )
    );
  }
}