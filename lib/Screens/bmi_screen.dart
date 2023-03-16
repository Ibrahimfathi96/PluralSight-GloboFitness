import 'package:flutter/material.dart';
import 'package:global_app_fitness/Shared/menu_drawer.dart';

import '../Shared/menu_bottom.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuButton(),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: const Center(child: FlutterLogo(),),
    );
  }
}
