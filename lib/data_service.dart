import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_flutter_app/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParams = {
      'q': city,
      'appid': 'eb6c2f39fd9dd2058d1b435f0cac0e2b',
      'units': 'metric'
    };

    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParams);
    final response = await http.get(uri);

    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
