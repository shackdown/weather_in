import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgeTemperature extends StatelessWidget {
  final Color colorBackground;
  final String temperature;

  const BadgeTemperature({
    super.key,
    required this.colorBackground,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      temperature,
      style: GoogleFonts.poppins(color: colorBackground, fontSize: 100),
    ).animate().fadeIn().shake();
  }
}
