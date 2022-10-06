import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget smallScreen;
  final Widget bigScreen;
  const ResponsiveLayout(
      {Key? key, required this.bigScreen, required this.smallScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return bigScreen;
        }
        return smallScreen;
      },
    );
  }
}
