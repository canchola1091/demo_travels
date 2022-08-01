
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_travels/src/controllers/clima/clima_controller.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:get/get.dart';


class CardIconClima extends StatelessWidget {
  const CardIconClima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Climacontroller>(
      // id: 'card-clima',
      builder: (_) => Card(
        margin: EdgeInsets.symmetric(horizontal: utils.porcientoW(Get.context, 20.0)),
        clipBehavior: Clip.antiAlias,
        elevation: 1.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            CachedNetworkImage(
              height: utils.porcientoW(Get.context, 26.0),
              imageUrl: 'https://openweathermap.org/img/wn/${_.gxClimaModel!.weather![0].icon}@2x.png',
              placeholder: (context, url) => LinearProgressIndicator(color: th.primaryColor, backgroundColor: th.primaryColor.withOpacity(0.3)),
              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red, size: 30.0),
            ),
            
            // Image.network(
            //   'https://openweathermap.org/img/wn/${_.gxClimaModel!.weather![0].icon}@2x.png',
            //   height: utils.porcientoW(Get.context, 26.0)
            // ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 7.0),
              child: CustomText(
                fTxt: '${_.gxClimaModel!.main!.temp}º C, ${_.gxClimaModel!.weather![0].description![0].toUpperCase()}' + _.gxClimaModel!.weather![0].description!.substring(1),  
                fSize: 16.0,
                fColor: Colors.black,
                fWeight: 'Bold',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0, bottom: 7.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pin_drop, size: 20.0, color: th.primaryColor),
                  CustomText(
                  fTxt: _.gxCountry,
                  fSize: 13.0,
                  fColor: Colors.black.withOpacity(0.5),
                  fWeight: 'Bold',
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}