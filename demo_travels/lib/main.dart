import 'package:demo_travels/src/data/global_preferences.dart';
import 'package:demo_travels/src/routes/routes.dart';
import 'package:demo_travels/src/services/push_notifications_provider.dart';
import 'package:demo_travels/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final GlobalPreferences _globalPrefs = GlobalPreferences();
  await _globalPrefs.initVarsPermanentes();
  await PushNotificationsServices.initNotification();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Travels',
      initialRoute: '/splash_page',
      getPages: Routes.routes,
      theme: theme,
    );
  }
}