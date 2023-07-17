// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weatherapp/Screens/SearchPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text(
          "Weather App",
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "There is no weather 🙂 \n start searching now 🔍",
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
