
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  
  static final GlobalPreferences _instancia = GlobalPreferences._internal(); 
  factory GlobalPreferences() {
    return _instancia;
  }
  GlobalPreferences._internal();
  late SharedPreferences _globalPreferences;
  initVarsPermanentes() async {
    _globalPreferences = await SharedPreferences.getInstance();
  }

  /// EMAIL DE USUARIO
  String? get userEmail => _globalPreferences.getString('userEmail');
  set userEmail(String? value) => _globalPreferences.setString('userEmail', value ?? '');

  /// NOMBRE DE USUARIO
  String? get userName => _globalPreferences.getString('userName');
  set userName(String? value) => _globalPreferences.setString('userName', value ?? '');

  /// TOKEN DEVICE DEL DISPOSITIVO
  String? get tokenDevice => _globalPreferences.getString('tokenDevice');
  set tokenDevice(String? value) => _globalPreferences.setString('tokenDevice', value ?? '');

  /// PATH DE IMAGEN
  String? get imagePath => _globalPreferences.getString('imagePath');
  set imagePath(String? value) => _globalPreferences.setString('imagePath', value ?? '');

  // LOGIN
  bool get isFisrtLogin => _globalPreferences.getBool('isFisrtLogin') ?? true;
  set isFisrtLogin(bool value) => _globalPreferences.setBool('isFisrtLogin', value);
} 