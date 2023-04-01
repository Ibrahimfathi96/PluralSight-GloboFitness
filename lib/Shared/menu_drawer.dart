import 'package:flutter/material.dart';
import 'package:global_app_fitness/Screens/weather_screen.dart';
import '../Screens/bmi_screen.dart';
import '../Screens/intro_screen.dart';
import '../Screens/sessions_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: 
          buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training'
    ];
    List<Widget> menuItems = [];
    menuItems.add(
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Center(
          child: Text(
            'Globo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
      ),
    );
    menuTitles.forEach(
      (String element) {
        Widget screen =Container();
        menuItems.add(ListTile(
          title: Text(
            element,
            style: const TextStyle(fontSize: 18),
          ),
          onTap: () {
            switch(element){
              case 'Home' : screen = IntroScreen();
              break;
              case 'BMI Calculator': screen = const BMIScreen();
              break;
              case 'Weather': screen = const WeatherScreen();
              break;
              case 'Training': screen = const SessionScreen();
              break;
            }
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => screen)
            );
          },
        ));
      },
    );
    return menuItems;
  }
}
