import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:karan_weather_app/model/five_day_model.dart/five_day_model.dart';
import 'current_weather_model/current_weather_model.dart';

class WeatherApi {
  static String baseUrl = 'https://api.openweathermap.org';
  static String apiKey = '9f906a4eb8bfa83de2ccffe74ba84113';

  static Future<CurrentWeatherModel?> getCurrentData(
      {required String cityName}) async {
    CurrentWeatherModel? weather;
    try {
      Uri url =
          Uri.parse("$baseUrl/data/2.5/weather?q=$cityName&appid=$apiKey");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = CurrentWeatherModel.fromJson(data);
    } catch (e) {
      return null;
    }
    return weather;
  }

  static Future<FiveDayModel> getFiveDayTemp({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/data/2.5/forecast?q=$cityName&appid=$apiKey');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    FiveDayModel weather = FiveDayModel.fromJson(data);
    return weather;
  }
}
