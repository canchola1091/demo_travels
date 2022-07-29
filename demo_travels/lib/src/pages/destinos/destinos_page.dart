
import 'package:demo_travels/src/controllers/destinos/destinos_controller.dart';
import 'package:demo_travels/src/widgets/destinos/card_destino.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:demo_travels/src/utils/utils.dart' as utils;


class DestinosPage extends StatelessWidget {
  const DestinosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DestinosController>(
      init: DestinosController(),
      builder: (_) => Scaffold(
        body: _body()
       )
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _customAppBar(),
          const SizedBox(height: 30.0),
          _listDestinos()
        ],
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: th.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0)
        )
      ),
      child: const CustomText(
        fTxt: 'Descubre tus Destinos Favoritos\n en Querétarro', // TODO: POner ciudad correcta
        fSize: 17.0,
        fColor: Colors.white,
        fWeight: 'Bold',
        fAlign: TextAlign.center,
      )
    );
  }

  Widget _listDestinos() {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        itemCount: Destinos.listDestinos.length,
        itemBuilder: (__, int index) => CardDestino(
          title: Destinos.listDestinos[index]["title"],
          description: Destinos.listDestinos[index]["description"],
          pathImg: Destinos.listDestinos[index]["img"],
          index: index,
        )
      )
    );
  }

}