import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyForecastElement extends StatelessWidget {
  final Color colorForeground;
  const WeeklyForecastElement({
    super.key,
    required this.colorForeground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "20°",
            style: GoogleFonts.poppins(
                color: colorForeground,
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
          ),
          Icon(
            Icons.water_drop,
            color: colorForeground,
          ),
          Text(
            "8 Jan",
            style: GoogleFonts.poppins(
                color: colorForeground,
                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize),
          ),
        ],
      ),
    );
  }
}
