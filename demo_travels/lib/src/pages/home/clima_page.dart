
import 'package:demo_travels/src/controllers/home/clima_controller.dart';
import 'package:demo_travels/src/widgets/clima/card_icon_clima.dart';
import 'package:demo_travels/src/widgets/clima/container_noticia.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:demo_travels/src/utils/utils.dart' as utils;


class ClimaPage extends StatelessWidget {
  const ClimaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Climacontroller>(
      init: Climacontroller(),
      builder: (_) => SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.menu, size: 35.0, color: Colors.black),
              onPressed: () {}, 
            ),
            title: CustomText(
              fTxt: 'Bienvenido Eduardo',
              fSize: 16.0,
              fColor: Colors.black.withOpacity(0.5),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  backgroundColor: th.primaryColor,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
              )
            ]
          ),
          body: _body()
        )
      )
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _headerClima()
        ]
      )
    );
  }

  Widget _headerClima() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: const TextSpan(
            children: <TextSpan> [
              TextSpan(
                text: 'Al parecer estas en ',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black
                )
              ),
              TextSpan(
                text: 'Querétaro, Centro',
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold
                )
              )
            ]
          )
        ),
        const SizedBox(height: 30.0),
        const CardIconClima(),
        const SizedBox(height: 30.0),
        const CustomText(
          fTxt: 'Mantente al día con las noticias de Querétaro', 
          fSize: 17.0,
          fColor: Colors.black,
          fWeight: 'Bold',
        ),
        const SizedBox(height: 10.0),
        CustomText(
          fTxt: 'Actualmente la gente está comentando sobre estas\nnoticias', 
          fSize: 14.0,
          fColor: Colors.black.withOpacity(0.5),
          fWeight: 'Bold',
        ),
        const SizedBox(height: 20.0),
        const ContainerNoticia(),
        const ContainerNoticia(),
        const ContainerNoticia(),
      ]
    );
  }

}