import 'package:flutter/cupertino.dart';
import 'package:karan_weather_app/model/current_weather_model/current_weather_model.dart';
import 'package:karan_weather_app/model/five_day_model.dart/five_day_model.dart';
import 'package:karan_weather_app/views/widgets/weather_graph.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeatherModel? _weatherData;

  String? cityName;
  set weatherData(CurrentWeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  CurrentWeatherModel? get weatherData => _weatherData;

  FiveDayModel? _weatherTemp;

  set weatherTemp(FiveDayModel? weather) {
    _weatherTemp = weather;
    notifyListeners();
  }

  FiveDayModel? get weatherTemp => _weatherTemp;

  List<WeatherData> getGraphData() {
    final List<WeatherData> graphData = [
      WeatherData(0, weatherTemp!.temp[0].toInt() - 273),
      WeatherData(3, weatherTemp!.temp[1].toInt() - 273),
      WeatherData(6, weatherTemp!.temp[2].toInt() - 273),
      WeatherData(9, weatherTemp!.temp[3].toInt() - 273),
      WeatherData(12, weatherTemp!.temp[4].toInt() - 273),
      WeatherData(15, weatherTemp!.temp[5].toInt() - 273),
      WeatherData(18, weatherTemp!.temp[6].toInt() - 273),
      WeatherData(21, weatherTemp!.temp[7].toInt() - 273),
      WeatherData(24, weatherTemp!.temp[8].toInt() - 273),
    ];
    return graphData;
  }
}
