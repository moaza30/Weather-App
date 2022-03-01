import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://www.metaweather.com';

  Future<int> getCityId(String cityName) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    http.Response response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);
    int cityId = data[0]['woeid'];
    return cityId;
  }

  Future<WeatherData> getWeather(String cityName) async {
    int id = await getCityId(cityName);
    Uri url = Uri.parse('$baseUrl/api/location/$id');
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData =
        jsonDecode(response.body)["consolidated_weather"][0];
    // Map<String, dynamic> data = jsonData["consolidated_weather"][0];
    WeatherData weatherData = WeatherData.fromJson(jsonData);
    return weatherData;
  }
}
