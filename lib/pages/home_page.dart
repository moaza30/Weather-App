import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/controllers/weather_provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherData? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: (Provider.of<WeatherProvider>(context).weatherData == null)
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()[400]!,
                  Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()[200]!,
                  Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()[50]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                children: [
                  Text(
                    'cairo',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, top: 10),
                    child: Text(
                      'Updated: ${Provider.of<WeatherProvider>(context).weatherData!.date!}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Provider.of<WeatherProvider>(context)
                            .weatherData!
                            .getImage(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Text(
                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherData!
                              .temp!
                              .toInt()
                              .toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Max Temp: ${Provider.of<WeatherProvider>(context, listen: false).weatherData!.maxTemp!.toInt().toString()}",
                          ),
                          Text(
                            'Min Temp: ${Provider.of<WeatherProvider>(context, listen: false).weatherData!.minTemp!.toInt().toString()}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData!
                          .weatherStateName!,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
