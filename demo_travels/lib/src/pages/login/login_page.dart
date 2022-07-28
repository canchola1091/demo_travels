
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_travels/src/controllers/login/login_controller.dart';
import 'package:demo_travels/src/validations/validations.dart';
import 'package:demo_travels/src/widgets/buttons/custom_button.dart';
import 'package:demo_travels/src/widgets/text/custom_text.dart';
import 'package:demo_travels/src/widgets/textfields/custom_textfield.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;
import 'package:demo_travels/src/theme/theme.dart' as th;


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: _body()
          )
         )
      );
  }

  Widget _body() {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FadeInUp(
          from: 20.0,
          delay: const Duration(milliseconds: 400),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: utils.porcientoH(Get.context, 10.0)),
                _headerlogin(),
                SizedBox(height: utils.porcientoH(Get.context, 7.0)),
                _form(),
                SizedBox(height: utils.porcientoH(Get.context, 4.0)),
                _butonLogin(_.fnLogin)
              ]
            )
          )
        )
      )
    );
  }

  Widget _headerlogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.backpack,
          size: utils.porcientoW(Get.context, 45.0),
          color: th.iconColor
        ),
        const SizedBox(height: 10.0),
        const CustomText(
          fTxt: 'Bienvenido', 
          fSize: 25.0,
          fColor: Colors.black,
          fWeight: 'Bold',
        ),
        const SizedBox(height: 7.0),
        CustomText(
          fTxt: 'Inicia sesión para disfrutar\nlos beneficios de la experiencia', 
          fSize: 18.0,
          fColor:th.subTitleColor,
          fAlign: TextAlign.center,
        ),
      ]
    );
  }
  
  Widget _form() {
    return GetBuilder<LoginController>(
      id: 'form',
      builder: (_) => Form(
        key: _.gxloginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                textLabel: '',
                textHint: 'Correo electrónico',
                borderField: 20.0,
                fieldController: _.gxEmailCtrl,
                typeKeyboard: TextInputType.emailAddress,
                validation: (_val) => Validations.validEmail(_val!)
              ),
              const SizedBox(height: 30.0),
              CustomTextField(
                textLabel: '',
                textHint: 'Contraseña',
                borderField: 20.0, 
                fieldController: _.gxPassWordCtrl,
                hideText: _.gxHidePass,
                iconSuffix: IconButton(
                  icon: Icon(
                    (_.gxHidePass)
                    ? Icons.visibility
                    : Icons.visibility_off,
                    color: Colors.grey
                  ),
                  onPressed: _.fnHidePass
                ),
                validation: (_val) => Validations.validRequiredAndLength(_val, 6),
              )
            ]
          )
        )
      ),
    );
  }

  Widget _butonLogin(void Function() _fnLogIn) {
    return CustomButton(
      width: utils.porcientoW(Get.context, 15.0),
      height: utils.porcientoH(Get.context, 5.0),
      bgColor: th.bgButon,
      splashColor: th.primaryColor,
      borderRadius: 13.0,
      childWidget: CustomText(
        fTxt: 'Acceder',
        fSize: 16.0,
        fColor: th.primaryColor,
        fWeight: 'Bold',
      ),
       btnFunction: _fnLogIn
    );
  }

}