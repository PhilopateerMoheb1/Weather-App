// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/Providers/weatherProvider.dart';
import 'package:weatherapp/Screens/SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUI() {
    setState(() {});
  }

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    // Image? image;
    weatherModel = Provider.of<WeatherProvider?>(context)?.weatherData;

    // if (state.contains("rain")) {
    //   image = Image.asset("assets/images/rainy.png");
    // } else if (state.contains("sun")) {
    //   image = Image.asset("assets/images/clear.png");
    // } else if (state.contains("cloud")) {
    //   image = Image.asset("assets/images/cloudy.png");
    // } else if (state.contains("snow")) {
    //   image = Image.asset("assets/images/snow.png");
    // } else if (state.contains("storm")) {
    //   image = Image.asset("assets/images/thunderstorm.png");
    // }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen(
                  updateUI: updateUI,
                );
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text(
          "Weather App",
        ),
      ),
      body: weatherModel == null
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "There is no weather 🙂 \n start searching now 🔍",
                    style: TextStyle(fontSize: 32),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.orange,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    weatherModel!.cityName!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherModel?.date ?? ' ',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/snow.png"),
                      Text(
                        "${weatherModel!.avgTemp!.toInt()}",
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text("Min temp: ${weatherModel!.minTemp!.toInt()}"),
                          Text("Max Temp: ${weatherModel!.maxTemp!.toInt()}"),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  Text(
                    weatherModel?.weatherStateName ?? " ",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              )),
            ),
    );
  }
}
