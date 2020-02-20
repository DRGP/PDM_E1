import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/colors.dart';
import 'package:practica_integradora_uno/registration.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LANDING_TITLE,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [cuppingSolidBlue, cuppingDeepBlue],
                  tileMode: TileMode.repeated,
                ),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 150,
                  ),
                  Image.asset(
                    'assets/cupping.png',
                    height: 125,
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  FlatButton(
                    child: Text('REGISTRATE'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Registration(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Login(),
                        ),
                      );
                    },
                    child: Text('INGRESA'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
