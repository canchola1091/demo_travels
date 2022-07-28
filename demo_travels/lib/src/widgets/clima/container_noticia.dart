
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:get/get.dart';

class ContainerNoticia extends StatelessWidget {
  const ContainerNoticia({Key? key}) : super(key: key);

  // TODO: Recibir path de imagen, titulo y subtitulo

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Noticia'),
      child: Container(
        width: utils.porcientoW(Get.context, 100.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.black.withOpacity(0.5))
        ),
        child: const ListTile(
          leading: FlutterLogo(
            size: 50.0,
          ),
          title: CustomText(
            fTxt: 'Aniv. en Retaurante La Terraza',
            fSize: 17.0,
          ),
          subtitle: CustomText(
            fTxt: 'Aniv. en Retaurante La Terraza',
            fSize: 17.0,
          )
        )
      )
    );
  }
}