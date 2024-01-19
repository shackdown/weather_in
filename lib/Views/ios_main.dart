import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_in/models/city.dart';
import 'package:weather_in/repositories/data_repository.dart';
import 'package:weather_in/utils/const.dart';

import 'package:weather_in/Views/Components/badge_date_widget.dart';
import 'package:weather_in/Views/Components/badge_temperature_widget.dart';
import 'package:weather_in/Views/Components/badge_weather_widget.dart';
import 'package:weather_in/Views/Components/daily_summary_widget.dart';
import 'package:weather_in/Views/Components/summary_bloc_widget.dart';
import 'package:weather_in/Views/Components/weekly_forecast_widget.dart';

class IosMain extends StatefulWidget {
  const IosMain({super.key});

  @override
  State<IosMain> createState() => _IosPageState();
}

class _IosPageState extends State<IosMain> {
  //
  List<City>? cities;
  City? city;
  Color? colorForeground;
  final Color colorBackground = kColorBlack;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);

    // get the list of cities
    cities = dataProvider.getCitiesList;
    // cities = dataProvider.getWeatherCityList;

    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cities!.length,
      itemBuilder: (_, index) {
        city = cities![index];
        colorForeground = city!.colorCity;

        return CupertinoPageScaffold(
          // navigationBar
          navigationBar: CupertinoNavigationBar(
            backgroundColor: colorForeground,
            border: null,
            middle: Text(
              city!.name,
              style: GoogleFonts.poppins(
                color: colorBackground,
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
            ),
          ),
          backgroundColor: colorForeground,
          // child <=> body
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Badge Date
                  BadgeDate(
                      colorBackground: colorBackground,
                      colorForeground: colorForeground!,
                      todayDate: city!.listWeather![0].dateWeather),

                  // Weather
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: BadgeWeather(
                        colorBackground: colorBackground,
                        weather: city!.listWeather![0].weather),
                  ),

                  // Temperature
                  Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: BadgeTemperature(
                          colorBackground: colorBackground,
                          temperature: city!.listWeather![0].temperature)),

                  // Daily Summary
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: DailySummary(
                      color: kColorBlack,
                      summary: kSampleDailySummary,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Summary bloc
                  SummaryBloc(
                    colorForeground: colorForeground!,
                    weather: city!.listWeather![0],
                  ),

                  const SizedBox(height: 15),

                  // Weekfly forecast
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: WeeklyForecast(colorForeground: colorBackground),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
