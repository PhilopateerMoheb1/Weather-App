import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weatherProvider.dart';
import 'package:weatherapp/Screens/HomeScreen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  WeatherProvider? weatherProvider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return weatherProvider;
      },
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
