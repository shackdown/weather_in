import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_in/utils/const.dart';

class SummaryBlocElement extends StatelessWidget {
  final Color colorString;
  final IconData iconElement;
  final String detail;
  final String category;

  const SummaryBlocElement(
      {super.key,
      required this.colorString,
      required this.iconElement,
      required this.detail,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconElement, color: colorString, size: kSizeIcon)
              .animate()
              .shake(),
          const SizedBox(height: 10),
          Text(
            detail,
            style: GoogleFonts.poppins(
                color: colorString,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize),
          ).animate().shake(),
          const SizedBox(height: 5),
          Text(
            category,
            style: GoogleFonts.poppins(
                color: colorString,
                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize),
          ).animate().shake(),
        ],
      ),
    );
  }
}
