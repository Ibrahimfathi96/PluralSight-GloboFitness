import 'package:flutter/material.dart';

class WeatherModel {
  String name;
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String description;
  double humidity;
  //Icon icon;
  WeatherModel(
      {required this.date,
        required this.name,
        required this.humidity,
        required this.temp,
        required this.maxTemp,
        required this.minTemp,
        //required this.icon,
        required this.description});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        name: data['location']['name'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        humidity: jsonData['avghumidity'],
        minTemp: jsonData['mintemp_c'],
        //icon: jsonData['condition']['icon'],
        description: jsonData['condition']['text']);
  }

  String getImage() {
    if (description == 'Thunderstorm' || description == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (description == 'Clear' || description == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (description == 'Sleet' ||
        description == 'Snow' ||
        description == 'Hail') {
      return 'assets/images/snow.png';
    } else if (description == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (description == 'Light Rain' ||
        description == 'Patchy rain Possible' ||
        description == 'Heavy Rain' ||
        description == 'Showers') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColors() {
    if (description == 'Thunderstorm' || description == 'Thunder') {
      return Colors.blueGrey;
    } else if (description == 'Clear' || description == 'Light Cloud') {
      return Colors.orange;
    } else if (description == 'Sleet' ||
        description == 'Snow' ||
        description == 'Hail') {
      return Colors.blue;
    } else if (description == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (description == 'Light Rain' ||
        description == 'Heavy Rain' ||
        description == 'Showers') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }

  @override
  String toString() {
    return 'avg.temp = $temp, max.temp = $maxTemp, data = $date, ';
  }
}