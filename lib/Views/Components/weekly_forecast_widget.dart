import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_in/Views/Components/weekly_forecast_element_widget.dart';

class WeeklyForecast extends StatelessWidget {
  final Color colorForeground;
  const WeeklyForecast({
    super.key,
    required this.colorForeground,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Weekfly forecast",
              style: GoogleFonts.poppins(
                  color: colorForeground,
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
            ),
            Icon(Icons.trending_flat, color: colorForeground, size: 45)
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 0, right: 15),
                  child: WeeklyForecastElement(
                    colorForeground: colorForeground,
                  ));
            },
          ),
        ),
      ],
    ).animate().fadeIn().slide();
  }
}
