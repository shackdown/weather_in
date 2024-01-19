import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class DailySummary extends StatelessWidget {
  final Color color;
  final String summary;

  const DailySummary({
    super.key,
    required this.color,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Daily Summary",
              style: GoogleFonts.poppins(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              summary,
              style: GoogleFonts.poppins(
                  color: color,
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize),
            ),
          ],
        ),
      ],
    ).animate().fadeIn().slide();
  }
}
