// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:visionia_app/Utils/TextApp.dart';
import 'package:visionia_app/Widgets/Desing/DesingWidgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //scroll, debido a que en dispositivos pequeños puede no verse el contenido.
        body: SingleChildScrollView(
          child: Container(
              //respeta un padding|margen en el laterial.
              padding: const EdgeInsets.symmetric(horizontal: 20),
              //cogemos el alto de la pantalla del dispositivo.
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: DesignWidgets.linearGradient(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DesignWidgets.tittleCustom(),
                  _loginButton(context),
                  _signUpButton(context)
                ],
              )),
        ),
      ),
    );
  }
}

Widget _loginButton(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 50.0, bottom: 25),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () => print("boton iniciar sesion pulsado"),
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.white,
      child: Text(
        TextApp.LOGIN,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _signUpButton(BuildContext context) {
  return Container(
    width: double.infinity,
    child: OutlineButton(
      borderSide: const BorderSide(color: Colors.white),
      highlightedBorderColor: Theme.of(context).primaryColorLight,
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      onPressed: () => print("boton registro pulsado"),
      child: const Text(
        TextApp.SINGUP,
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    ),
  );
}
