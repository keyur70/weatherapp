import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_demo/api_provider/weather_api_provider.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;
  WeatherBloc(this.weatherService) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      // Loading
      emit(WeatherLoading());
      try {
        final weather = await weatherService.fetchWeather(event.city);
        if (weather.data != null) {
          // Loaded
          emit(WeatherLoaded(weather));
        } else {
          emit(WeatherError('Could not fetch weather data.'));
        }
      } catch (e) {
        emit(WeatherError('Error: ${e.toString()}'));
      }
    });
  }
}
