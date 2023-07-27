// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weatherProvider.dart';
import 'package:weatherapp/Screens/HomeScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context).weatherData!.getColor(),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
