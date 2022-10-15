import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/widgets/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Button({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.openSansCondensed(
            color: backgroundColor, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: otherColor,
          minimumSize: const Size(double.infinity, 50)),
    );
  }
}
