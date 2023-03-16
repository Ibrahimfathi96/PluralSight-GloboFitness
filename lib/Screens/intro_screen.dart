import 'package:flutter/material.dart';
import 'package:global_app_fitness/Shared/menu_drawer.dart';

import '../Shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuButton(),
      appBar: AppBar(
        title: const Text('Globo Fitness'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/travel.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white54, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(24),
            child: const Text(
              'Commit to be fit, dare to be great \nwith Globo Fitness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                      offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.grey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
