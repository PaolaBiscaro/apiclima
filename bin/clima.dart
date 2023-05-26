import 'package:dio/dio.dart';
import 'package:intl/intl.dart' as intl;

Future<void> main() async {
  //final dio = Dio();
  // final response = await dio.get(
  //     'https://api.openweathermap.org/data/2.5/weather?lat=-22.2139&lon=-49.9458&appid=fbdeba5a0084be7e4b5dce465ccb7b99');

  var uri = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {
        'lat': '-22.2139',
        'lon': '-49.9458',
        'appid': 'fbdeba5a0084be7e4b5dce465ccb7b99',
      });

  var dio = Dio();
  var response = await dio.get(uri.toString());

  if (response.statusCode == 200) {
    final data = response.data;

    print(
        "Temperatura de ${kelvinToCelsius(response.data['main']['temp'])}°C, em ${data['name']} no dia ${timestampUnixToDataHora(data['dt'])} ");
    //print(data['main']['temp']);
  } else {
    print('Erro ao fazer requisição ${response.statusCode}');
  }
}

String kelvinToCelsius(double tempKelvin) {
  double tempCelsius = tempKelvin - 273.15;
  return tempCelsius.toStringAsPrecision(4);
}

String timestampUnixToDataHora(int timestamp) {
  DateTime data =
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
  final formatoSaida = intl.DateFormat("dd/MM/yyyy HH:mm");
  DateTime dataLocal = data.toLocal();
  return formatoSaida.format(dataLocal);
}
