import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp_demo/const/api_url.dart';
import 'package:weatherapp_demo/model/custom_model.dart';
import 'package:weatherapp_demo/model/weather_model.dart';
import 'package:weatherapp_demo/service/api_service..dart';

class WeatherService {
  final ApiService apiService = ApiService();

  // Fetch Weather Data
  Future<CustomModel<WeatherModel>> fetchWeather(String city) async {
    final response =
        await apiService.get(ApiUrl.getWeatherInfoUrl, queryParameters: {
      "q": city,
      'key': dotenv.env['WEATHER_API_KEY'],
    });

    if (response.statusCode == 200) {
      return CustomModel(data: WeatherModel.fromJson(response.data));
    } else {
      return CustomModel(
          status: 400, data: WeatherModel.fromJson(response.data));
    }
  }
}
