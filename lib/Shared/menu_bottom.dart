import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blueGrey,
      selectedIconTheme:
          const IconThemeData(color: Colors.blueGrey, opacity: 1.0, size: 30.0),
      //unselected items color gives color to the BottomNavigationBarItem's title widget, which is currently unselected
      unselectedItemColor: Colors.black,
      //unselected icons theme gives icon theme the BottomNavigationBarItem's icon widget, which is currently unselected
      unselectedIconTheme:
          const IconThemeData(color: Colors.black, opacity: 1.0, size: 30.0),
      currentIndex: selected,
      onTap: (index) {
        switch (index) {
          case 0:
            setState(() {
              selected = index;
            });
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            setState(() {
              selected = index;
            });
            Navigator.pushNamed(context, '/bmi');
            break;
          case 2:
            setState(() {
              selected = index;
            });
            Navigator.pushNamed(context, '/weather');
            break;
          case 3:
            setState(() {
              selected = index;
            });
            Navigator.pushNamed(context, '/session');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'BMI'),
        BottomNavigationBarItem(
            icon: Icon(Icons.nights_stay), label: 'Weather'),
        BottomNavigationBarItem(
            icon: Icon(Icons.model_training), label: 'Session'),
      ],
    );
  }
}
