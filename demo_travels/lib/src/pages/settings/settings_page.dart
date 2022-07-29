
import 'package:demo_travels/src/controllers/settings/settings_controller.dart';
import 'package:demo_travels/src/widgets/buttons/custom_button.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_travels/src/theme/theme.dart' as th;
import 'package:demo_travels/src/utils/utils.dart' as utils;


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()
    );
  }

  Widget _body() {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (_) => SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  _userInfo(),
                  _settingAccount(),
                  _moreSettings(),
                  _btnLogout(_.showAlertLogOut),
                ]
              )
            )
          ]
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: utils.porcientoH(Get.context, 4.0)),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: th.primaryColor,
            child: const Icon(Icons.person, color: Colors.white),
          ),

          title: const CustomText(
            fTxt: 'Eduardo Sanchez', 
            fSize: 17.0,
            fWeight: 'Bold',
          ),

          subtitle: const CustomText(
            fTxt: 'eduardo_sc@gmail.com', 
            fSize: 14.0
          ),

          trailing: Container(
            height: 42.0,
            width: 42.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(100.0)
            ),
            child: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.black
            )
          )

        )

      )
    );
  }

  Widget _settingAccount() {
    return Padding(
      padding: EdgeInsets.only(bottom: utils.porcientoH(Get.context, 4.0)),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: _itemSettings(Icons.person_outline_outlined, 'Ajustes de cuenta', true)
      )
    );
  }

  Widget _moreSettings() {
    return Padding(
      padding: EdgeInsets.only(bottom: utils.porcientoH(Get.context, 4.0)),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          children: [
            _itemSettings(Icons.language, 'Idioma', false),
            _itemSettings(Icons.chat_outlined, 'Soporte', false),
            _itemSettings(Icons.star_outline, 'Calificanos', false),
            _itemSettings(Icons.security_update_outlined, 'Nueva versión', false),
          ],
        )
      )
    );
  }

  Widget _itemSettings(IconData icon, String title, bool isAccount) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
        color: Colors.black
      ),

      title: CustomText(
        fTxt: title, 
        fSize: 17.0,
      ),

      trailing: Icon(
        (isAccount)
        ? Icons.edit_outlined
        : Icons.arrow_forward_ios_outlined,
        size: (isAccount) ? 25.0 : 16.0,
        color: (isAccount) ? Colors.black : Colors.grey
      )

    );
  }

  Widget _btnLogout(void Function() _showAlertLogOut) {
    return CustomButton(
      bgColor: Colors.red,
      borderRadius: 12.0,
      width: utils.porcientoW(Get.context, 10.0),
      childWidget: const CustomText(
        fTxt: 'Cerrar sesión',
        fSize: 17.0,
        fColor: Colors.white,
      ),
      btnFunction: _showAlertLogOut
    );
  }

}