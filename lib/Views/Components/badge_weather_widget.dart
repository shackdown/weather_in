import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgeWeather extends StatelessWidget {
  final Color colorBackground;
  final String weather;

  const BadgeWeather({
    super.key,
    required this.colorBackground,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      weather,
      style: GoogleFonts.poppins(
          color: colorBackground,
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize),
    ).animate().slide();
  }
}
