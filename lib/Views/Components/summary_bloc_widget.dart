import 'package:flutter/material.dart';
import 'package:weather_in/Views/Components/summary_bloc_element_widget.dart';
import 'package:weather_in/models/weather.dart';
import 'package:weather_in/utils/const.dart';

class SummaryBloc extends StatelessWidget {
  final Color colorForeground;
  final Weather weather;

  const SummaryBloc(
      {super.key, required this.colorForeground, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 120,
      decoration: const BoxDecoration(
        color: kColorBlack,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SummaryBlocElement(
              colorString: colorForeground,
              iconElement: Icons.air,
              detail: weather.wind,
              category: 'wind'),
          SummaryBlocElement(
              colorString: colorForeground,
              iconElement: Icons.water_drop,
              detail: weather.humidity,
              category: 'humidity'),
          SummaryBlocElement(
              colorString: colorForeground,
              iconElement: Icons.visibility,
              detail: '0.0 km',
              category: 'visibility'),
        ],
      ),
    );
  }
}
