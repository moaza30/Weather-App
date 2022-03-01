import 'package:flutter/material.dart';
import 'package:weather_app/controllers/weather_provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = 'SearchScreen';
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherData weather = await service.getWeather(cityName!);
              /*  Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;*/
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              labelText: 'Search',
              hintText: 'Search a City',
              suffixIcon: InkWell(
                child: Icon(Icons.search),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
