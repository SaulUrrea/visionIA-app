// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:visionia_app/MainScreens/login/welcomeScreen.dart';
import 'package:visionia_app/Utils/AssetsImages.dart';
import 'package:visionia_app/Utils/ConstantsApp.dart';
import 'package:visionia_app/Utils/TextApp.dart';
import 'package:visionia_app/Widgets/Desing/DesingWidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff2c2b50),
        primaryColorDark: const Color(0xff050028),
        primaryColorLight: const Color(0xff57547c),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffedecee)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: ConstantsAPP.TIME_SPLASH_SCREEN, //Genera una carga de 5 segundos
      navigateAfterSeconds:
          const WelcomeScreen(), //Me envia a la pantalla indicada
      //image: AssetsImages.ImageLogo(), //Pone una imagen en la pantalla de carga
      backgroundColor:
          Colors.white, //Asigna un color de fondo a la pantalla de carga
      photoSize: 120, //Genera una tamano a la imagen de carga
      loaderColor:
          Theme.of(context).primaryColor, //Indica un color a la rueda de carga
      loadingText:
          const Text(TextApp.LOADING), //Genera un texto en la pantalla de carga
      gradientBackground: DesignWidgets.linearGradient(context),
      title: const Text(
        TextApp.TITULO,
        style: TextStyle(
          color: Colors.black,
          letterSpacing: 1.5,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          backgroundColor: Color(0xffAEADE7),
        ),
      ),
      imageBackground: AssetsImages.ImageBackgraund1(),
    );
  }
}
