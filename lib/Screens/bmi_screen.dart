import 'package:flutter/material.dart';
import 'package:global_app_fitness/Shared/menu_drawer.dart';

import '../Shared/menu_bottom.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;
  double? height;
  double? weight;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please Insert Your Height in ${(isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please Insert Your Weight in ${(isMetric) ? 'kilos' : 'pounds'}';
    return Scaffold(
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuButton(),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ToggleButtons(
                isSelected: isSelected,
                onPressed: toggleMeasure,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metric',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: heightMessage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: weightMessage),
              ),
            ),
            Center(child: ElevatedButton(onPressed:calculateBMI, child: Text('Calculate BMI',style: TextStyle(fontSize: 18),))),
            Center(child: Text(result,style: TextStyle(fontSize: 18),))
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void calculateBMI(){
    double bmi = 0;
    double height = double.tryParse(txtHeight.text)?? 0 ;
    double weight = double.tryParse(txtWeight.text)?? 0 ;
    if(isMetric){
      bmi = weight / (height * height);
    }else{
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }
}
