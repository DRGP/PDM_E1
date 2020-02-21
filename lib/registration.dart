import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/colors.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: REGISTRATION_TITLE,
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
                        labelText: 'Email',
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
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(value: false, onChanged: null),
                      Text('ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO'),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Login(),
                        ),
                      );
                    },
                    child: Text('REGISTRATE'),
                  ),
                  Text('¿Ya tienes una cuenta?'),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
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
