
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:demo_travels/src/data/global_preferences.dart';
import 'package:demo_travels/src/utils/utils.dart' as utils;

class PushNotificationsServices {
  
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> _onBackgroundHandler(RemoteMessage _message) async {
    print('--> 📲📲📲 Notificación: ');
    print('_onBackgroundHandler: ${_message.messageId}');
  }

  static Future<void> _onMessageHandler(RemoteMessage _message) async {
    print('--> 📲 📲 📲 Notificación: App Primero Plano');
    print('_onMessageHandler: ${_message.messageId}');
  }

  static Future<void> _onMessageOpenApp(RemoteMessage _message) async {
    print('--> 📲📲📲 Notificación: ');
    print('_onMessageOpenApp: ${_message.messageId}');
  }

  static Future initNotification() async {
    final _globalPrefs = GlobalPreferences();
    await Firebase.initializeApp();
    NotificationSettings _permission = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false
    );
    utils.msginfo('User granted permission: ${_permission.authorizationStatus}');
    

    final _tokenDevice = await _firebaseMessaging.getToken();
    _globalPrefs.tokenDevice = _tokenDevice;
    utils.msginfo("=== TOKEN DEVICE ===");
    utils.msginfo(_tokenDevice);
    utils.msginfo("====================");
    try {
      _firebaseMessaging.subscribeToTopic('weather');
    } catch (e) {
      utils.msginfo(e);
    }
    
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

  }


}

