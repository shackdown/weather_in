import 'package:flutter/material.dart';

import 'package:weather_in/models/weather.dart';

class City {
  final String name;
  final Color colorCity;
  double? latitude;
  double? longitude;
  List<Weather>? listWeather = [];

  //
  City({
    required this.name,
    required this.colorCity,
    this.latitude,
    this.longitude,
    this.listWeather,
  });

  City copyWith({
    String? name,
    Color? colorCity,
    double? latitude,
    double? longitude,
    List<Weather>? listWeather,
  }) {
    return City(
      name: name ?? this.name,
      colorCity: colorCity ?? this.colorCity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      listWeather: listWeather ?? this.listWeather,
    );
  }
}
