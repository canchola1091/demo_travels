
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:get/get.dart';

class ContainerNoticia extends StatelessWidget {

  final String title;
  final String description;
  final String pathImg;

  const ContainerNoticia({
    Key? key,
    required this.title,
    required this.description,
    required this.pathImg
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Noticia'), //TODO: Si da tiempo implementar navegación a vista de detalle
      child: Container(
        width: utils.porcientoW(Get.context, 100.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.black.withOpacity(0.4))
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
          )
        )
      )
    );
  }
}

class Noticias {
  
  static List<Map<String, dynamic>> listNoticias = [
    {
      "title": "Eventos en Bellas Artes",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/noticias/img_noti1.png"
    },
    {
      "title": "Conoce los mejores lugares",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/noticias/img_noti2.png"
    },
    {
      "title": "Destinos turiticos por conocer",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/noticias/img_noti3.png"
    },
    {
      "title": "Playas bonitas cerca de la CDMX",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "img": "assets/noticias/img_noti4.png"
    },

  ];



}