
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/widgets/buttons/custom_button.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';


class AlertLogOut extends StatelessWidget {

  final void Function() fnDone;   // Fucnión para botón de 'ACEPTAR'
  final void Function() fnCancel; // Función para botón de 'ATRAS/CANCELAR'

  const AlertLogOut({
    Key? key,
    required this.fnDone,
    required this.fnCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipInX(
      child: AlertDialog(
        scrollable: true,
        insetPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0)
          ),
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
          width: utils.porcientoW(Get.context, 70),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.message_outlined),
                    SizedBox(width: 10.0),
                    CustomText(
                      fTxt: '¿Estas seguro que deseas\n salir de tu cuenta?',
                      fSize: 17.0,
                      fColor: Colors.black
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      height: utils.porcientoH(Get.context, 5.0),
                      width: utils.porcientoW(Get.context, 7.0),
                      borderRadius: 10.0,
                      bgColor: th.primaryColor,
                      childWidget: const CustomText(
                        fTxt: 'Aceptar',
                        fSize: 16.0,
                        fColor: Colors.white,
                      ), 
                      btnFunction: fnDone
                    ),
                    CustomButton(
                      height: utils.porcientoH(Get.context, 5.0),
                      width: utils.porcientoW(Get.context, 7.0),
                      borderRadius: 10.0,
                      bgColor: Colors.grey,
                      childWidget: const CustomText(
                        fTxt: 'Cancelar',
                        fSize: 16.0,
                        fColor: Colors.white,
                      ), 
                      btnFunction: fnCancel
                    )
                  ]
                )
              ]
            )
          ) 
        )
      )
    );
  }
}

