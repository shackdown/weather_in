import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Weather {
  final String dateWeather;
  final String weather;
  final Icon? weatherIcon;
  final String temperature;
  final String? dailySummary;
  final String wind;
  final String humidity;
  final String? visibility;

  //
  Weather({
    required this.dateWeather,
    required this.weather,
    this.weatherIcon,
    required this.temperature,
    this.dailySummary,
    required this.wind,
    required this.humidity,
    this.visibility,
  });

  // convert dateTimeString to formate DD, Month, Year
  static formateDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('dd, MMMM yyyy').format(dateTime);
  }

  // convert the weather code
  // https://open-meteo.com/en/docs
  // WMO Weather interpretation codes (WW)
  static convertWeatherCode(String weatherCode) {
    switch (weatherCode) {
      case '0':
        return 'Clear sky';
      case '1':
        return 'Mainly clear';
      case '2':
        return 'Partly cloudy';
      case '3':
        return 'Overcast';
      case '45':
        return 'Fog';
      case '48':
        return 'Depositing Rime Fog';
      case '51':
        return 'Drizzle: Light';
      case '53':
        return 'Drizzle: Moderate';
      case '55':
        return 'Drizzle: Dense';
      case '56':
        return 'Freezing Drizzle: Light';
      case '57':
        return 'Freezing Drizzle: Dense';
      case '61':
        return 'Rain: Slight';
      case '63':
        return 'Rain: Moderate';
      case '65':
        return 'Rain: Heavy';
      case '66':
        return 'Freezing Rain: Light';
      case '67':
        return 'Freezing Rain: Heavy';
      case '71':
        return 'Snow fall: Slight';
      case '73':
        return 'Snow fall: Moderate';
      case '75':
        return 'Snow fall: Heavy';
      case '77':
        return 'Snow grains';
      case '80':
        return 'Rain showers: Slight';
      case '81':
        return 'Rain showers: Moderate';
      case '82':
        return 'Rain showers: Violent';
      case '85':
        return 'Snow showers: Slight';
      case '86':
        return 'Snow showers: Heavy';
      case '95':
        return 'Thunderstorm';
      case '96':
        return 'Thunderstorm with slight';
      case '99':
        return 'Thunderstorm with heavy hail';
      default:
        return weatherCode;
    }
  }
}
