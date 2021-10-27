import 'package:flutter/material.dart';
import 'package:vision_app/ui/pages/history_page.dart';
import 'package:vision_app/ui/pages/home_page.dart';
import 'package:vision_app/ui/screens/splash_screen.dart';

void main() => runApp(MyApp());

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
          'history': (context) => HistoryPage(),
        });
  }
}
