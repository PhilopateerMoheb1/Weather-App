// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Models/WeatherModel.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String key = "9938b8f80a29407f973141629231607";
  Future<WeatherModel?> getWeather({
    required String cityName,
    required String serviceName,
  }) async {
    WeatherModel? weatherModel;
    try {
      Uri url =
          Uri.parse("$baseUrl/$serviceName.json?key=$key&q=$cityName&aqi=no");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherModel = WeatherModel.fromJson(data, cityName);
    } catch (e) {
      print(e);
    }
    return weatherModel;
  }
}
