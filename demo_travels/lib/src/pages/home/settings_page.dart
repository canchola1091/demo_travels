
import 'package:demo_travels/src/controllers/home/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (_) => const Scaffold(
        backgroundColor: Colors.pink,
        body: Center(
          child: Text('Settings Page'),
        )
      )
    );
  }
}