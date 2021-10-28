import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vision_app/main.dart';
import 'package:vision_app/ui/widgets/theme/images.dart';
import 'package:vision_app/ui/widgets/theme/style.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, isViewed != 0 ? 'onboarding' : 'home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: loadMessage(),
      ),
    );
  }

  Column loadMessage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Vision IA',
          style: textStyleBlack,
        ),
        SizedBox(
          height: 5.0,
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.black,
          color: Colors.white,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Cargando ...',
          style: textStyleBlack,
        )
      ],
    );
  }
}
