
import 'package:demo_travels/src/controllers/destinos/destinos_controller.dart';
import 'package:demo_travels/src/widgets/destinos/card_destino.dart';
import 'package:demo_travels/src/widgets/destinos/map_destino.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class DetailDestinoPage extends StatelessWidget {
  
  final int index;

  const DetailDestinoPage({
    Key? key,
    required this.index
  }) : super(key: key);

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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _nameandImgDestino(),
                    _descriptionAndMap()
                  ]
                )
              )
            )
          ]
        )
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: th.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0)
        )
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(), 
        ),
        title: const Center(
          child: CustomText(
              fTxt: 'Detalles del destino',
              fSize: 17.0,
              fColor: Colors.white,
              fWeight: 'Bold',
              fAlign: TextAlign.center,
            ),
        ),

        trailing: const IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.transparent) ,         
          onPressed: null
        )
      )

    );
  }

  Widget _nameandImgDestino() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const SizedBox(height: 15.0),

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fTxt: Destinos.listDestinos[index]["title"],
                fSize: 16.0,
                fWeight: 'Bold',
              ),
              const SizedBox(height: 7.0),
              Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.pin_drop, color: th.primaryColor),
                const CustomText(
                  fTxt: 'Polanco Benito Juarez, CDMX', // TODO: Poner dirección correcta
                  fSize: 14.0
                )
              ]
              )
            ]
          ),

          const SizedBox(height: 15.0),
          _carouselImg(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.watch_later, size: 22.0, color: th.primaryColor),
              const SizedBox(width: 8.0),
              const CustomText(
                fTxt: 'Abierto de',
                fSize: 15.0
              )
            ]
          ),
          CustomText(
            fTxt: Destinos.listDestinos[index]["day_open"],
            fSize: 14.0
          ),
          CustomText(
            fTxt: Destinos.listDestinos[index]["hour_open"],
            fSize: 14.0
          ),
          const SizedBox(height: 15.0),
        ]
      )
    );
  }

  Widget _carouselImg() {

  final SwiperController _swiperController     = SwiperController();

    return SizedBox(
      height: utils.porcientoH(Get.context, 30.0),
      width: double.infinity,
      child: Swiper(
        controller: _swiperController,
        pagination: const SwiperPagination(),
        outer: true,
        itemCount: Destinos.listDestinos[index]["carousel_img"].length,
        itemBuilder: (__, int i) => Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Image.asset(
            Destinos.listDestinos[index]["carousel_img"][i],
            fit: BoxFit.cover,
          )
        ),
        scale: 0.7,
        loop: false,
        viewportFraction: 1.0,
      )
    );
  }

  Widget _descriptionAndMap() {
    return GetBuilder<DestinosController>(
      id: 'map-destino',
      builder: (_) => Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
    
            const SizedBox(height: 10.0),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _.setViewMap(!_.gxViewMap),
                  child: Text(
                    'Más información',
                    style: TextStyle(
                      fontSize: 15.0,
                      color:  Colors.black.withOpacity(0.6),
                      decoration: TextDecoration.underline
                    )
                  ),
                ),
                CustomText(
                  fTxt: 'Visita el destino',
                  fSize: 15.0,
                  fColor: Colors.black.withOpacity(0.6),
                )
              ]
            ),
            const SizedBox(height: 10.0),
            (_.gxViewMap)
            ? _mapDestino()
            : CustomText(
              fTxt: Destinos.listDestinos[index]["description"],
              fSize: 16.0,
              fColor: Colors.black.withOpacity(0.6),
              fAlign: TextAlign.justify
            ),
            const SizedBox(height: 15.0),
            if(!_.gxViewMap) CustomText(
              fTxt: Destinos.listDestinos[index]["description"],
              fSize: 16.0,
              fColor: Colors.black.withOpacity(0.6),
              fAlign: TextAlign.justify
            )
          ]
        )
      ),
    );
  }

  Widget _mapDestino() {
    return SizedBox(
      width: double.infinity,
      height: utils.porcientoH(Get.context, 35.0),
      child: MapDestino(
        latitude: Destinos.listDestinos[index]["lat"],
        longitude: Destinos.listDestinos[index]["long"],
      )
    );
  }

}