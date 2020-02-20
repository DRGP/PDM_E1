import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LOGIN_TITLE,
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
                    height: 100,
                  ),
                  Image.asset(
                    'assets/cupping.png',
                    height: 75,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre completo',
                        fillColor: cuppingWhite,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: cuppingWhite,
                        filled: true,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(title: 'Test'),
                        ),
                      );
                    },
                    child: Text('ENTRAR'),
                  ),
                  Text('¿Olvidaste tu pasword?'),
                  Text('¿Aún no tienes una cuenta?'),
                  FlatButton(
                    onPressed: () {},
                    child: Text('REGÍSTRATE'),
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
