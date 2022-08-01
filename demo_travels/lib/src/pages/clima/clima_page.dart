
import 'package:demo_travels/src/controllers/clima/clima_controller.dart';
import 'package:demo_travels/src/widgets/clima/card_icon_clima.dart';
import 'package:demo_travels/src/widgets/clima/container_noticia.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:http/http.dart';


class ClimaPage extends StatelessWidget {
  const ClimaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: th.bgScaffold,
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
        body:  _body()
      )
    );
  }

  Widget _body() {
    return GetBuilder<Climacontroller>(
      init: Climacontroller(),
      id: 'body-clima',
      builder: (_) => (_.gxLocationLoaded)
      ? SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: 
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerClima(_.gxAddress),
            _listNoticias()
          ]
        ) 
      )
      : _locationLoading()
    );
  }

  Widget _headerClima(String _address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan> [
              const TextSpan(
                text: 'Al parecer estas en ',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black
                )
              ),
              TextSpan(
                text: _address,
                style: const TextStyle(
                  color: Colors.black, 
                  fontSize: 15.0,
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
          fSize: 15.0,
          fColor: Colors.black,
          fWeight: 'Bold',
        ),
        const SizedBox(height: 10.0),
        CustomText(
          fTxt: 'Actualmente la gente está comentando sobre estas\nnoticias', 
          fSize: 13.0,
          fColor: Colors.black.withOpacity(0.5),
          fWeight: 'Bold',
        ),
        const SizedBox(height: 20.0),
      ]
    );
  }

  Widget _listNoticias() {
    return Flexible(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      itemCount: Noticias.listNoticias.length,
      itemBuilder: (__, int index) => ContainerNoticia(
          title: Noticias.listNoticias[index]["title"], 
          description: Noticias.listNoticias[index]["description"], 
          pathImg: Noticias.listNoticias[index]["img"],
        )
      )
    );
  }

  Widget _locationLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 20.0),
          CustomText(fTxt: 'Obteniendo ubicación', fSize: 15.0)
        ]
      )
    );
  }

}