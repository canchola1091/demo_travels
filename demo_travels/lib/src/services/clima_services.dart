
import 'package:demo_travels/src/models/clima_model.dart';
import 'package:demo_travels/src/widgets/alerts/simple_alert.dart';
import 'package:http/http.dart' as http;
import 'package:demo_travels/src/utils/utils.dart' as utils;

class ClimaServices {

  final String _host = 'api.openweathermap.org';
  final String _apiKey = '9860759e03658ea484af4e0f2af60e01';
  
  //==========================================================
  /// OBTENER LISTA DE EMPLEADOS
  //==========================================================
  Future serviceGetClima(String latitude, String longitude) async {
    utils.msginfo('--> Obteniendo Clima...');
    final Map<String, dynamic> _params = {
      "lat"  : latitude,
      "lon" : longitude,
      "appid": _apiKey,
      "lang" : "es",
      "units": "metric"
    };
    final _url = Uri.https(_host, 'data/2.5/weather', _params);
    try {
      final _resp = await http.get( _url );
      // print('--> Resp: ${_resp.body}');
      // print('--> Status: ${_resp.statusCode}');
      if(_resp.statusCode == 200) {
        return climaModelFromJson(_resp.body);
      }else {
        SimpleAlert().cAlert('Upss!!', 'Ocurrio un error al obtener el clima');
        utils.msgerror('Error al obtener la lista de Empleados');
      }
    } catch (e) {
      utils.msgerror('--> CATCH');
    }
  }

}