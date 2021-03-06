import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_app/ui/bloc/cubit/tfmodel_cubit.dart';
import 'package:vision_app/ui/pages/chat_page.dart';
import 'package:vision_app/ui/pages/home_page.dart';
import 'package:vision_app/ui/pages/mascotas_page.dart';
import 'package:vision_app/ui/pages/plantas_page.dart';
import 'package:vision_app/ui/screens/draw_screen.dart';
import 'package:vision_app/ui/screens/onboarding_screen.dart';
import 'package:vision_app/ui/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vision_app/config/injection_container.dart' as di;

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<TfmodelCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Vision App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          'home': (context) => HomePage(),
          'onboarding': (context) => OnBoardingScreen(),
          'mascotas': (context) => MascotasPage(),
          'plantas': (context) => PlantasPage(),
          'digitos': (context) => DrawScreen(),
          'chat': (context) => Chat(),
        },
      ),
    );
  }
}
