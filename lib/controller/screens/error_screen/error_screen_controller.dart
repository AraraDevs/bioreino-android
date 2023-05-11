import 'package:bioreino_mobile/controller/database/mongodb.dart';
import 'package:bioreino_mobile/controller/screens/splash_screen/route_animation.dart';
import 'package:bioreino_mobile/view/screens/error_screen/error_screen.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/widgets.dart';

void setButtonJustPressed([bool buttonPressed = true]) {
  ConnectionErrorScreen.buttonJustPressed = buttonPressed;
}

retryConnectionIfCan(BuildContext context, Function onError) async {
  if (ConnectionErrorScreen.buttonJustPressed) {
    await Future.delayed(const Duration(seconds: 1));
    await Database.connect().then((connected) {
      connected ? changeScreen(context, const ScreenNavigator()) : onError();
    });
  }
}