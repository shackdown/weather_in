import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:weather_in/models/city.dart';
import 'package:weather_in/api/api.dart';
import 'package:weather_in/models/weather.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

  // call api
  Future<Response> getData(String urlApi,
      {Map<String, dynamic>? params}) async {
    // paramètrage
    Map<String, dynamic> query = {};

    // si des paramètres sont passés, on les ajoute à _query
    if (params != null) {
      query.addAll(params);
    }

    // on fait l'appel
    final response = await dio.get(urlApi, queryParameters: query);

    // la requête est OK?
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

// get location (longitude & latitude)
  Future<City> getLocation({required City city}) async {
    final response =
        await getData(api.urlLocation, params: {'name': city.name, 'count': 1});
    if (response.statusCode == 200) {
      final results = response.data['results'] as List<dynamic>;
      if (results.isNotEmpty && results[0] is Map) {
        final resultData = results[0] as Map<String, dynamic>;

        city.longitude = resultData['longitude'];
        city.latitude = resultData['latitude'];

        // get weather
        final response = await getData(api.urlWeather, params: {
          'latitude': city.latitude,
          'longitude': city.longitude,
          'current': [
            "relative_humidity_2m",
            "apparent_temperature",
            "weather_code",
            "wind_speed_10m"
          ],
          "timezone": "auto"
        });
        if (response.statusCode == 200) {
          var results = response.data;
          var units = results['current_units'];
          results = results['current'];
          Weather weatherTmp = Weather(
              dateWeather: Weather.formateDate(results['time'].toString()),
              weather: Weather.convertWeatherCode(
                  results['weather_code'].toString()),
              temperature: results['apparent_temperature'].toString() +
                  units['apparent_temperature'],
              wind: results['wind_speed_10m'].toString() +
                  units['wind_speed_10m'],
              humidity: results['relative_humidity_2m'].toString() +
                  units['relative_humidity_2m']);

          City cityOut = city.copyWith(listWeather: [weatherTmp]);
          return cityOut;
        } else {
          throw ApiException(
            statusCode: response.statusCode ?? 0,
            message: 'Failed to load weather data',
          );
        }
      } else {
        throw Exception('Invalid data structure');
      }
    } else {
      throw ApiException(
        statusCode: response.statusCode ?? 0,
        message: 'Failed to load location data',
      );
    }
  }

  // get weather
  Future<City> getWeather({required City city}) async {
    final response = await getData(api.urlWeather, params: {
      'latitude': city.latitude,
      'longitude': city.longitude,
      'current': [
        "relative_humidity_2m",
        "apparent_temperature",
        "weather_code",
        "wind_speed_10m"
      ],
      "timezone": "auto"
    });

    if (response.statusCode == 200) {
      // final results = response.data;
      // debugPrint(results);
      return city;
    } else {
      throw ApiException(
        statusCode: response.statusCode ?? 0,
        message: 'Failed to load weather data',
      );
    }
  }

  // get Cities
  Future<List<City>> getCities() async {
    List<City> cities = [
      City(name: 'Paris', colorCity: Colors.yellow),
      City(name: 'Lyon', colorCity: Colors.lightBlue),
      City(name: 'Toulouse', colorCity: Colors.pinkAccent),
      City(name: 'Bordeaux', colorCity: Colors.green),
      City(name: 'Marseille', colorCity: Colors.redAccent),
      City(name: 'New York', colorCity: Colors.blueGrey),
    ];
    return cities;
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException({required this.statusCode, required this.message});

  @override
  String toString() => 'ApiException: $message (Status code: $statusCode)';
}
