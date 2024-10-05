import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_demo/api_provider/weather_api_provider.dart';
import 'package:weatherapp_demo/bloc/weather_bloc/weather_bloc.dart';
import 'package:weatherapp_demo/view/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(WeatherService()),
      child: const MaterialApp(
        title: 'Weather App',
        home: HomeScreen(),
      ),
    );
  }
}
