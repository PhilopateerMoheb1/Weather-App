// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/Providers/weatherProvider.dart';
import 'package:weatherapp/Services/WeatherService.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;
  WeatherModel? weatherModel;

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              weatherModel = await service.getWeather(
                  CityName: cityName!, serviceName: "forecast");
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 24,
              ),
              suffixIcon: Icon(
                Icons.search,
              ),
              label: Text("Search"),
              border: OutlineInputBorder(),
              hintText: "Enter a City",
            ),
            showCursor: true,
          ),
        ),
      ),
    );
  }
}
