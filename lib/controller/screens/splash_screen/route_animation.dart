import 'package:bioreino_mobile/controller/database/mongodb.dart';
import 'package:bioreino_mobile/controller/screens/login_screen/login_controller.dart';
import 'package:bioreino_mobile/view/screens/error_screen/error_screen.dart';
import 'package:bioreino_mobile/view/screens/login/login_screen.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:flutter/material.dart';

Future<void> connectAndChangeScreen(BuildContext context) async {
  final bool connected = await Database.connect();
  if (context.mounted) {
    if (connected) {
      if (await checkStudentAlreadyLogged()) {
        if (context.mounted) changeScreen(context, const ScreenNavigator());
      } else if (context.mounted) {
        changeScreen(context, const LoginScreen());
      }
    } else {
      changeScreen(context, const ConnectionErrorScreen());
    }
  }
}

Future<dynamic> changeScreen(BuildContext context, Widget page) {
  return Navigator.pushReplacement(context, _animatedRoute(page));
}

PageRouteBuilder _animatedRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
