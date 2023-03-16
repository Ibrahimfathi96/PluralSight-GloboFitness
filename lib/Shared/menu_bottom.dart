import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index){
        switch(index){
          case 0 : Navigator.pushNamed(context, '/');
          break;
          case 1 : Navigator.pushNamed(context, '/bmi');
          break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'BMI'),
      ],
    );
  }
}
