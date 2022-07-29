
import 'package:demo_travels/src/pages/destinos/detail_destino.dart';
import 'package:demo_travels/src/widgets/buttons/custom_button.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:get/get.dart';

class CardDestino extends StatelessWidget {

  final String title;
  final String description;
  final String pathImg;
  final int index;

  const CardDestino({
    Key? key,
    required this.title,
    required this.description,
    required this.pathImg,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(

        leading: Container(
          width: utils.porcientoW(Get.context, 18),
          height: utils.porcientoW(Get.context, 19),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Image.asset(pathImg, fit: BoxFit.cover)
        ),

        title: CustomText(
          fTxt: title,
          fSize: 17.0,
          fWeight: 'Bold',
        ),

        subtitle: CustomText(
          fTxt: description,
          fSize: 15.0,
          fMaxLines: 1
        ),
        
        trailing: SizedBox(
          height: utils.porcientoH(Get.context, 4.0),
          child: CustomButton(
            elevation: 0.0,
            width: utils.porcientoW(Get.context, 5.0),
            bgColor: th.primaryColor,
            childWidget: const CustomText(
              fTxt: 'Ver más',
              fSize: 16.0,
              fColor: Colors.white,
            ),
            btnFunction: () => Get.to( () => DetailDestinoPage(index: index) )
            )
          )
      
      )
    );
  }
}

class Destinos {
  
  static List<Map<String, dynamic>> listDestinos = [
    {
      "title": "Basílica de Guadalupe",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/destinos/des1/img_desti1.png",
      "carousel_img": [
        "assets/destinos/des1/carousel/des1_carousel1.png",
        "assets/destinos/des1/carousel/des1_carousel2.png",
        "assets/destinos/des1/carousel/des1_carousel3.png",
      ],
      "day_open": "Martes a Domingo",
      "hour_open": "9:00 AM - 6:30 PM",
      "lat": 19.493407,
      "long": -99.112414
    },

    {
      "title": "Alameda Central",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/destinos/des2/img_desti2.png",
      "carousel_img": [
        "assets/destinos/des2/carousel/des2_carousel1.png",
        "assets/destinos/des2/carousel/des2_carousel2.png",
        "assets/destinos/des2/carousel/des2_carousel3.png",
      ],
      "day_open": "Todos los días",
      "hour_open": "24 hrs",
      "lat": 19.4357353,
      "long": -99.1461373
    },

     {
      "title": "Museo Soumaya",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/destinos/des3/img_desti3.png",
      "carousel_img": [
        "assets/destinos/des3/carousel/des3_carousel1.png",
        "assets/destinos/des3/carousel/des3_carousel2.png",
        "assets/destinos/des3/carousel/des3_carousel3.png",
      ],
      "day_open": "Martes a Domingo",
      "hour_open": "10:00 AM - 6:30 PM",
      "lat": 19.4531245,
      "long": -99.2022181
    },

    {
      "title": "Museo de los Duendes",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/destinos/des4/img_desti4.png",
      "carousel_img": [
        "assets/destinos/des4/carousel/des4_carousel1.png",
        "assets/destinos/des4/carousel/des4_carousel2.png",
        "assets/destinos/des4/carousel/des4_carousel3.png",
      ],
      "day_open": "Martes a Domingo",
      "hour_open": "8:30 AM - 5:30 PM",
      "lat": 20.2076588,
      "long": -98.5490363
    },
    
  ];



}