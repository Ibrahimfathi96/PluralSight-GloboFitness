import 'package:flutter/material.dart';
import 'package:global_app_fitness/Screens/bmi_screen.dart';
import 'package:global_app_fitness/Screens/weather_screen.dart';
import 'Screens/intro_screen.dart';
import 'Screens/sessions_screen.dart';

void main() {
  runApp(GloboFitnessAPP());
}

class GloboFitnessAPP extends StatelessWidget {
  const GloboFitnessAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (_)=> IntroScreen(),
        '/bmi':(_)=> const BMIScreen(),
        '/weather':(_)=> const WeatherScreen(),
        '/session':(_)=> SessionScreen(),
      },
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // home: IntroScreen(),
    );
  }
}
