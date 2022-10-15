import 'package:flutter/material.dart';
import 'package:mychat/common/widgets/error.dart';
import 'package:mychat/features/auth/screens/login.dart';
import 'package:mychat/features/auth/screens/otp_screen.dart';
import 'package:mychat/features/auth/screens/user_information.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Login.routeName:
      return MaterialPageRoute(builder: (context) => const Login());
    case OTPScreen.routename:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(
                verificationId: verificationId,
              ));
    case UserInform.routename:
      return MaterialPageRoute(builder: (context) => const UserInform());
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: 'No exist'),
              ));
  }
}
