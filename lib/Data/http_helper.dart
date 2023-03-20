import 'dart:convert';

import 'package:global_app_fitness/Data/weather.dart';
import 'package:http/http.dart' as http;
class HttpHelper{
  //https:// => Protocol
  //api.weatherapi.com/=> domain or authority
  // api.weatherapi.com? => Path
  // key=b38bb987235c42959b820024231803& => key parameter
  // q=Cairo&days=1&aqi=no&alerts=no => other params

  final String authority = 'api.weatherapi.com';
  final String path = 'api.weatherapi.com';
  final String apiKey = 'b38bb987235c42959b820024231803';
  Future<String> getWeather(String location)async{
    Map<String, dynamic> parameters={
      'q':location,'key' : apiKey, 'days' : '1'
    };
    Uri uri = Uri.https(authority,path,parameters);
    http.Response response = await http.get(uri);
    return response.body;
  }
  Future<WeatherModel> getWeatherData(String location)async{
    var request = http.Request('GET', Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=b38bb987235c42959b820024231803&q=$location&days=1&aqi=no&alerts=no'));


    http.StreamedResponse response = await request.send();
    var finalResponse = '';
    if(response.statusCode != 200) {
       response.reasonPhrase;
    }
    if (response.statusCode == 200) {
      finalResponse = await response.stream.bytesToString();
    }
    Map<String,dynamic> data = jsonDecode(finalResponse);
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }
}