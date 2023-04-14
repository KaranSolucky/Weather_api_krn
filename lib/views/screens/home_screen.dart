import 'package:flutter/material.dart';
import 'package:karan_weather_app/views/widgets/search_widget.dart';
import '../widgets/sun_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? cityName;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(-15583849),
              Color(0xFF97ABFF),
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/home_icon.png"),
                  SearchWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  const SunAnimationWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
