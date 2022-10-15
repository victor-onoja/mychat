import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/common/utils/utils.dart';
import 'package:mychat/common/widgets/button.dart';
import 'package:mychat/features/auth/controller/auth_controller.dart';
import 'package:mychat/widgets/colors.dart';

class Login extends ConsumerStatefulWidget {
  static const routeName = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        countryListTheme: CountryListThemeData(
            backgroundColor: backgroundColor,
            textStyle:
                GoogleFonts.openSansCondensed(fontWeight: FontWeight.bold),
            bottomSheetHeight: MediaQuery.of(context).size.height * 0.75),
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    print('tap received');
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInwithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else if (country == null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInwithPhone(context, '+234$phoneNumber');
    } else {
      showSnackbar(
          context: context, content: 'please check again', color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Enter your phone number',
          style: GoogleFonts.openSansCondensed(
              fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'myChat will need to verify your phone number',
                style: GoogleFonts.openSansCondensed(
                    fontWeight: FontWeight.bold, color: textColor),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: pickCountry,
                  child: Text(
                    'Pick Country',
                    style: GoogleFonts.openSansCondensed(
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 5,
              ),
              Row(children: [
                country != null
                    ? Text('+${country!.phoneCode}',
                        style: GoogleFonts.openSansCondensed(
                            fontWeight: FontWeight.bold, color: textColor))
                    : Text('+234',
                        style: GoogleFonts.openSansCondensed(
                            fontWeight: FontWeight.bold, color: textColor)),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.openSansCondensed(
                        fontWeight: FontWeight.bold, color: textColor),
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: 'phone number',
                        hintStyle: GoogleFonts.openSansCondensed(
                            fontWeight: FontWeight.bold, color: textColor)),
                  ),
                ),
              ]),
              SizedBox(
                height: size.height * 0.5,
              ),
              SizedBox(
                width: 90,
                child: Button(text: 'NEXT', onPressed: sendPhoneNumber),
              )
            ],
          ),
        ),
      ),
    );
  }
}
