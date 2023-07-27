// ignore_for_file: file_names, avoid_print, use_build_context_synchronously, must_be_immutable

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
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              weatherModel = await service.getWeather(
                  cityName: cityName!, serviceName: "forecast");
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 24,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  WeatherService service = WeatherService();
                  weatherModel = await service.getWeather(
                      cityName: cityName!, serviceName: "forecast");
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weatherModel;
                  Navigator.pop(context);
                },
              ),
              label: const Text("Search"),
              border: const OutlineInputBorder(),
              hintText: "Enter a City",
            ),
            showCursor: true,
          ),
        ),
      ),
    );
  }
}
