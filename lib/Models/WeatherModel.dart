// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'dart:core';

class WeatherModel {
  String? date;
  double? avgTemp;
  double? minTemp;
  double? maxTemp;
  String? weatherStateName;
  String? cityName;
  WeatherModel({
    required this.date,
    required this.avgTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.maxTemp,
    required this.cityName,
  });
  factory WeatherModel.fromJson(dynamic data, String cityName) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
      cityName: cityName,
      date: data["location"]["localtime"],
      avgTemp: jsonData["avgtemp_c"],
      minTemp: jsonData["mintemp_c"],
      weatherStateName: jsonData["condition"]["text"],
      maxTemp: jsonData["maxtemp_c"],
    );
  }
}
