import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherData? _weatherData;

  set weatherData(WeatherData? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherData? get weatherData => _weatherData;
}
