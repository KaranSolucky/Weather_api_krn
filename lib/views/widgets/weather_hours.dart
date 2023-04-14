import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karan_weather_app/constants.dart';
import 'package:karan_weather_app/controller/weather_provider.dart';
import 'package:karan_weather_app/model/five_day_model.dart/five_day_model.dart';

class WeatherHours extends StatefulWidget {
  const WeatherHours({Key? key}) : super(key: key);

  @override
  State<WeatherHours> createState() => _WeatherHoursState();
}

class _WeatherHoursState extends State<WeatherHours> {
  @override
  Widget build(BuildContext context) {
    String? cityName = Provider.of<WeatherProvider>(context).cityName;
    FiveDayModel? weatherTemp =
        Provider.of<WeatherProvider>(context).weatherTemp;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFF08244F),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                'Weather for $cityName for the next 24 hours',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Joan-Regular',
                ),
              ),
            ),
            const Divider(color: Colors.white54, thickness: 2),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.13,
              child: ListView.builder(
                itemCount: weatherTemp!.temp.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${next3Hours[index]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Joan-Regular',
                                  fontWeight: FontWeight.bold)),
                          Text('${weatherTemp.temp[index].toInt() - 273}°',
                              style: const TextStyle(
                                fontSize: 40,
                                fontFamily: 'Joan-Regular',
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
