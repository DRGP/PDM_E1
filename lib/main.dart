import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/colors.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: _cuppingTheme,
      home: Home(title: APP_TITLE),
      initialRoute: '/landing',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/landing') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Landing(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _cuppingTheme = _buildCuppingTheme();

ThemeData _buildCuppingTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: cuppingSolidBlue,
  );
}
