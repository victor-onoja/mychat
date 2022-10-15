import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/common/widgets/button.dart';
import 'package:mychat/features/auth/screens/login.dart';
import 'package:mychat/widgets/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              'Welcome to myChat',
              style: GoogleFonts.openSansCondensed(
                  fontSize: 33, color: textColor, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Image.asset('assets/landing.png',
                height: 340,
                width: 340,
                color: Colors.white.withOpacity(0.6),
                colorBlendMode: BlendMode.modulate),
            SizedBox(
              height: size.height / 9,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: GoogleFonts.openSansCondensed(
                    color: textColor, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: size.width * 0.75,
                child: Button(
                    text: 'AGREE AND CONTINUE',
                    onPressed: () => navigateToLogin(context))),
            const SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
