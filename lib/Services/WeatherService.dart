// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;

class WeatherService {
  Future<http.Response> getWeather({required String CityName}) async {
    Uri url = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=9938b8f80a29407f973141629231607&q=$CityName&aqi=no");
    http.Response response = await http.get(url);
    return response;
  }
}
