// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  String? CityName;

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
            onSubmitted: (data) {
              CityName = data;
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
