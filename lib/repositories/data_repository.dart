import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:weather_in/api/api_service.dart';
import 'package:weather_in/models/city.dart';

class DataRepository with ChangeNotifier {
  final APIService apiService = APIService();
  final List<City> _cityList = [];
  // final List<City> _cityWeatherList = [];

  // getters
  List<City> get getCitiesList => _cityList;
  // List<City> get getWeatherCityList => _cityWeatherList;

  Future<void> getCities() async {
    try {
      List<City> cities = await apiService.getCities();

      // Exécuter les appels API en parallèle
      final futures = <Future<City>>[];
      for (var city in cities) {
        futures.add(apiService.getLocation(city: city));
      }

      // Attendre que tous les appels soient terminés et collecter les résultats
      final results = await Future.wait(futures);

      // Ajouter les résultats à la liste des villes
      _cityList.addAll(results);

      // Notifier les listeners une fois que toutes les données sont chargées
      notifyListeners();
    } on Response catch (response) {
      debugPrint("ERROR: ${response.statusCode}");
      rethrow;
    }
  }

  // Future<void> getWeatherCities() async {
  //   try {
  //     for (var i = 0; i < _cityList.length; i++) {
  //       City cityOut = await apiService.getWeather(city: _cityList[i]);
  //       debugPrint(cityOut.name);
  //       _cityWeatherList.add(cityOut);
  //     }
  //     notifyListeners();
  //   } on Response catch (response) {
  //     debugPrint("ERROR: ${response.statusCode}");
  //     rethrow;
  //   }
  // }

  Future<void> initData() async {
    await Future.wait([
      getCities(),
    ]);
  }
}
