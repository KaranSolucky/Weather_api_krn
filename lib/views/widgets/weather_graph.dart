import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:karan_weather_app/controller/weather_provider.dart';

class WeatherGraph extends StatefulWidget {
  @override
  State<WeatherGraph> createState() => _WeatherGraphState();
  late int i = i + 1;
}

class _WeatherGraphState extends State<WeatherGraph> {
  WeatherData? weather;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? cityName = Provider.of<WeatherProvider>(context).cityName;
    return SingleChildScrollView(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF08244F),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      child: SfCartesianChart(
          title: ChartTitle(
              text:
                  'Comparison of the weather for the next 24 hours for $cityName'),
          series: <ChartSeries>[
            LineSeries<WeatherData, int>(
              dataSource: Provider.of<WeatherProvider>(context).getGraphData(),
              xValueMapper: (WeatherData weather, _) => weather.hours,
              yValueMapper: (WeatherData weather, _) => weather.temp,
            )
          ]),
    ));
  }
}

class WeatherData {
  WeatherData(this.hours, this.temp);

  final int hours;
  final int temp;
}
