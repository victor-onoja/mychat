import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/features/auth/controller/auth_controller.dart';
import 'package:mychat/widgets/colors.dart';

class OTPScreen extends ConsumerWidget {
  static const String routename = '/otp-screen';
  final String verificationId;
  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Verifying your number...',
          style: GoogleFonts.openSansCondensed(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('We have sent an sms with a code',
              style:
                  GoogleFonts.openSansCondensed(fontWeight: FontWeight.bold)),
          SizedBox(
            width: size.width * 0.5,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: GoogleFonts.openSansCondensed(
                      fontWeight: FontWeight.bold, fontSize: 30)),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 6) {
                  verifyOTP(ref, context, value.trim());
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
