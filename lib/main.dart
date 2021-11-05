import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_app/ui/bloc/cubit/tfmodel_cubit.dart';
import 'package:vision_app/ui/pages/chat_page.dart';
import 'package:vision_app/ui/pages/history_page.dart';
import 'package:vision_app/ui/pages/home_page.dart';
import 'package:vision_app/ui/pages/mascotas_page.dart';
import 'package:vision_app/ui/pages/plantas_page.dart';
import 'package:vision_app/ui/screens/onboarding_screen.dart';
import 'package:vision_app/ui/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vision_app/config/injection_container.dart' as di;

int? isViewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          'history': (context) => HistoryPage(),
          'mascotas': (context) => MascotasPage(),
          'plantas': (context) => PlantasPage(),
          'chat': (context) => Chat(),
        },
      ),
    );
  }
}
