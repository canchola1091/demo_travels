
import 'package:demo_travels/src/controllers/destinos/destinos_controller.dart';
import 'package:demo_travels/src/widgets/destinos/card_destino.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_travels/src/theme/theme.dart' as th;


class DestinosPage extends StatelessWidget {
  const DestinosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: th.bgScaffold,
      body: _body()
    );
  }

  Widget _body() {
    return GetBuilder<DestinosController>(
      init: DestinosController(),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _customAppBar(),
            const SizedBox(height: 30.0),
            _listDestinos()
          ]
        )
      )
    );
  }

  Widget _customAppBar() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: th.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0)
        )
      ),
      child: const CustomText(
        fTxt: 'Descubre tus Destinos Favoritos',
        fSize: 15.0,
        fColor: Colors.white,
        fWeight: 'Bold',
        fAlign: TextAlign.center,
      )
    );
  }

  Widget _listDestinos() {
    return GetBuilder<DestinosController>(
      builder: (_) => Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          itemCount: Destinos.listDestinos.length,
          itemBuilder: (__, int index) => CardDestino(
            title: Destinos.listDestinos[index]["title"],
            description: Destinos.listDestinos[index]["description"],
            pathImg: Destinos.listDestinos[index]["img"],
            index: index,
            onClick: () => _.getAddressFromLatLong(Destinos.listDestinos[index]["lat"], Destinos.listDestinos[index]["long"], index),
          )
        )
      )
    );
  }

}