
import 'package:demo_travels/src/controllers/home/home_controller.dart';
import 'package:demo_travels/src/pages/clima/clima_page.dart';
import 'package:demo_travels/src/pages/destinos/destinos_page.dart';
import 'package:demo_travels/src/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:demo_travels/src/theme/theme.dart' as th;

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'bottom_nav_menu',
      init: HomeController(),
      builder: (_) => Scaffold(
        body: IndexedStack(
          index: _.gSelectedIndex,
          children: const [
            ClimaPage(),
            DestinosPage(),
            SettingsPage()
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15.0),
              topLeft: Radius.circular(15.0)
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10.0,
                spreadRadius: 1,
                offset: const Offset(0.0, 5.0),
              )
            ]
          ),
          child: BottomNavigationBar(
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            selectedItemColor: th.secondaryColor,
            unselectedItemColor: th.subTitleColor,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30.0,
                  color: (_.gSelectedIndex == 0)
                  ? th.primaryColor
                  : Colors.black
                ),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_outlined,
                  size: 30.0,
                  color: (_.gSelectedIndex == 1)
                  ? th.primaryColor
                  : Colors.black
                ),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 30.0,
                  color: (_.gSelectedIndex == 2)
                  ? th.primaryColor
                  : Colors.black
                ),
                label: ''
              ),
            ],
            currentIndex: _.gSelectedIndex,
            onTap: _.onItemTapped
          ),
        ),
      ),
    );
  }

}