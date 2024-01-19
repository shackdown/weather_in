import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgeDate extends StatelessWidget {
  final Color colorBackground;
  final Color colorForeground;
  final String todayDate;

  const BadgeDate(
      {super.key,
      required this.colorBackground,
      required this.colorForeground,
      required this.todayDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
        child: Text(
          todayDate,
          style: GoogleFonts.poppins(
              color: colorForeground,
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize),
        ).animate().fade(),
      ),
    );
  }
}
