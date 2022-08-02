

import 'package:demo_travels/src/pages/clima/clima_page.dart';
import 'package:demo_travels/src/pages/destinos/destinos_page.dart';
import 'package:demo_travels/src/pages/home/home_page.dart';
import 'package:demo_travels/src/pages/login/login_page.dart';
import 'package:demo_travels/src/pages/settings/settings_page.dart';
import 'package:demo_travels/src/pages/splash/splash_page.dart';
import 'package:get/route_manager.dart';

class Routes {

  static List<GetPage> routes = [
    GetPage( name: '/splash_page',   page: () => const SplashPage() ),
    GetPage( name: '/login_page',    page: () => const LoginPage() ),
    GetPage( name: '/home_page',     page: () => const HomePage() ),
    GetPage( name: '/clima_page',    page: () => const ClimaPage() ),
    GetPage( name: '/destinos_page', page: () => const DestinosPage() ),
    GetPage( name: '/settings_page', page: () => const SettingsPage() ),
  ];

}