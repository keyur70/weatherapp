import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp_demo/bloc/weather_bloc/weather_bloc.dart';
import 'package:weatherapp_demo/bloc/weather_bloc/weather_event.dart';
import 'package:weatherapp_demo/bloc/weather_bloc/weather_state.dart';
import 'package:weatherapp_demo/common/widgtes/background.dart';
import 'package:weatherapp_demo/const/color.dart';
import 'package:weatherapp_demo/const/extension.dart';
import 'package:weatherapp_demo/const/image.dart';
import 'package:weatherapp_demo/service/location_service.dart';
import 'package:weatherapp_demo/view/widgtes/search_textfiled.dart';
import 'package:weatherapp_demo/view/widgtes/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getUserCurrentLoction();
  }

  // Get User Current Loction
  getUserCurrentLoction() async {
    LocationService locationService = LocationService();
    Position position = await locationService.getUserLocation();
    context
        .read<WeatherBloc>()
        .add(FetchWeatherEvent("${position.latitude},${position.longitude}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CommanBackgroundColor(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchTextFiled(),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(
                        child: CupertinoActivityIndicator(
                            color: ConstColor.whiteColor));
                  } else if (state is WeatherLoaded) {
                    return WeatherCard(weather: state.weather.data);
                  } else if (state is WeatherError) {
                    return Image.asset(ConstImage.errorImage);
                  }
                  return const Center(
                      child: CupertinoActivityIndicator(
                          color: ConstColor.whiteColor));
                },
              ),
              0.hs,
            ],
          ),
        ),
      ),
    );
  }
}
