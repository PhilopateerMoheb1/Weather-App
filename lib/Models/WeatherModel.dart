// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import 'dart:core';

class WeatherModel {
  String? date;
  double? avgTemp;
  double? minTemp;
  double? maxTemp;
  String? weatherStateName;
  String? cityName;
  String? path;

  WeatherModel({
    required this.date,
    required this.avgTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.maxTemp,
    required this.cityName,
  });
  factory WeatherModel.fromJson(dynamic data, String cityName) {
    if (cityName == "london") {
      print("object");
    }
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
  void getImage() {
    if (matches(weatherStateName!, "rain")) {
      path = "assets/images/rainy.png";
    } else if (matches(weatherStateName!, "Sunny")) {
      path = "assets/images/clear.png";
    } else if (matches(weatherStateName!, "Cloudy")) {
      path = "assets/images/cloudy.png";
    } else if (matches(weatherStateName!, "Snow")) {
      path = "assets/images/snow.png";
    } else if (matches(weatherStateName!, "Thunderstorm") ||
        matches(weatherStateName!, "Thunder")) {
      path = "assets/images/thunderstorm.png";
    }
  }

  MaterialColor? getColor() {
    if (matches(weatherStateName!, "rain")) {
      return Colors.blue;
    } else if (matches(weatherStateName!, "Sunny")) {
      return Colors.orange;
    } else if (matches(weatherStateName!, "Cloudy")) {
      return Colors.blueGrey;
    } else if (matches(weatherStateName!, "Snow")) {
      return Colors.grey;
    } else if (matches(weatherStateName!, "Thunderstorm") ||
        matches(weatherStateName!, "Thunder")) {
      return Colors.grey;
    } else {
      return Colors.green;
    }
  }
}
