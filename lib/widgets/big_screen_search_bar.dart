import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/widgets/colors.dart';

class BigScreenSearchBar extends StatelessWidget {
  const BigScreenSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: appBarColor))),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: textColor,
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.search_sharp,
                size: 20,
              ),
            ),
            hintStyle: GoogleFonts.openSansCondensed(fontSize: 14),
            hintText: 'Search or start new chat',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none)),
            contentPadding: const EdgeInsets.all(10)),
      ),
    );
  }
}
