
import 'package:demo_travels/src/controllers/home/destinos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class DestinosPage extends StatelessWidget {
  const DestinosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DestinosController>(
      init: DestinosController(),
      builder: (_) => const Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Text('Destinos Page'),
       ),
       ),
    );
  }
}