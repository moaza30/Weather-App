import 'package:flutter/material.dart';

class WeatherData {
  final String? weatherStateName;
  final String? date;
  final double? minTemp, maxTemp, temp;

  WeatherData({
    this.weatherStateName,
    this.date,
    this.minTemp,
    this.maxTemp,
    this.temp,
  });

  factory WeatherData.fromJson(Map<String, dynamic> data) {
    return WeatherData(
      weatherStateName: data["weather_state_name"],
      date: data["applicable_date"],
      maxTemp: data["max_temp"],
      minTemp: data["min_temp"],
      temp: data["the_temp"],
    );
  }

  String getImage() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.grey;
    } else if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}
