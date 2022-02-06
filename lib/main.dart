import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_flutter_app/models.dart';

import 'data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  var _response = WeatherResponse();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                'Weather',
                style: TextStyle(color: Colors.white),
              )),
              backgroundColor: Colors.greenAccent,
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response.weatherInfo?.description != null)
                  Column(
                    children: [
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.temp?.temperature}°C',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        _response.weatherInfo?.description ?? "",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                      controller: _cityTextController,
                      decoration: InputDecoration(
                        labelText: '`Enter a City',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _search,
                  child: Text('Search'),
                  style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                )
              ],
            ))));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
