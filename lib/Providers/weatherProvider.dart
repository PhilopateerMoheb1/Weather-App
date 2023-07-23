import 'package:flutter/material.dart';
import 'package:weatherapp/Models/WeatherModel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weatherModel) {
    _weatherData = weatherModel;
    notifyListeners();
  }

  WeatherModel? get weatherData {
    return _weatherData;
  }
}
