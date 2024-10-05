import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

class WeatherModel {
  Location location;
  Current current;

  WeatherModel({
    required this.location,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );
}

class Current {
  double tempC;
  double tempF;
  Condition condition;
  double windKph;
  double pressureMb;
  int humidity;
  double heatindexC;

  Current({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windKph,
    required this.pressureMb,
    required this.humidity,
    required this.heatindexC,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json["temp_c"]?.toDouble(),
        tempF: json["temp_f"]?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
        windKph: json["wind_kph"],
        pressureMb: json["pressure_mb"],
        humidity: json["humidity"],
        heatindexC: json["heatindex_c"]?.toDouble(),
      );
}

class Condition {
  String text;

  Condition({
    required this.text,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
      );
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );
}
