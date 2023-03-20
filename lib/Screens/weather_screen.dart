import 'package:flutter/material.dart';
import 'package:global_app_fitness/Data/http_helper.dart';
import 'package:global_app_fitness/Data/weather.dart';

import '../Shared/menu_bottom.dart';
import '../Shared/menu_drawer.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  WeatherModel result = WeatherModel(
      name: '',
      date: '',
      humidity: 0,
      temp: 0,
      maxTemp: 0,
      minTemp: 0,
      description: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuButton(),
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                    hintText: 'Enter a city',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: getData,
                    )),
              ),
            ),
            weatherRow('Country: ', result.name),
            weatherRow('Date: ', result.date),
            weatherRow('Description: ', result.description),
            weatherRow('Avg.Temperature: ', result.temp.toString()),
            weatherRow('Max.Temperature: ', result.maxTemp.toString()),
            weatherRow('Min.Temperature: ', result.minTemp.toString()),
            weatherRow('Humidity: ', result.humidity.toString()),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeatherData(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
    return row;
  }
}
