import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mychat/firebase_options.dart';
import 'package:mychat/widgets/colors.dart';
import 'package:mychat/responsive/responsive_layout.dart';
import 'package:mychat/screens/big_screen_layout.dart';
import 'package:mychat/screens/small_screen_layout..dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myChat',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const ResponsiveLayout(
          bigScreen: BigScreen(), smallScreen: SmallScreen()),
    );
  }
}
