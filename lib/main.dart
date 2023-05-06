import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BioReino());
}

class BioReino extends StatelessWidget {
  const BioReino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BRTheme.lightTheme,
      darkTheme: BRTheme.darkTheme,
      home: const ScreenNavigator(),
    );
  }
}