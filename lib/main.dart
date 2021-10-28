import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vision_app/ui/pages/history_page.dart';
import 'package:vision_app/ui/pages/home_page.dart';
import 'package:vision_app/ui/pages/mascotas_page.dart';
import 'package:vision_app/ui/pages/plantas_page.dart';
import 'package:vision_app/ui/pages/virtualreality_page.dart';
import 'package:vision_app/ui/screens/onboarding_screen.dart';
import 'package:vision_app/ui/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vision App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          'home': (context) => HomePage(),
          'onboarding': (context) => OnBoardingScreen(),
          'history': (context) => HistoryPage(),
          'mascotas': (context) => MascotasPage(),
          'plantas': (context) => PlantasPage(),
          'vr': (context) => VirtualRealityPage(),
        });
  }
}
