class WeatherResponse {
  final String? cityName;
  final Temperature? temp;
  final WeatherInfo? weatherInfo;

  String get iconUrl {
    return "https://openweathermap.org/img/wn/${weatherInfo?.icon}@2x.png";
  }

  WeatherResponse({this.cityName, this.temp, this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempJson = json['main'];
    final temp = Temperature.fromJson(tempJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        cityName: cityName, temp: temp, weatherInfo: weatherInfo);
  }
}

class Temperature {
  final double? temperature;

  Temperature({this.temperature});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return Temperature(temperature: temperature);
  }
}

class WeatherInfo {
  final String? description;
  final String? icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}
