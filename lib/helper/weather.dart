import 'package:climax/networking/location.dart';
import 'package:flutter/material.dart';
import 'package:climax/networking/NetworkHelper.dart';

class weather {

  var imageAndText = {};

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = new NetworkHelper("https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=7ae534c3dc8e5ffc15f22533a0f91e11");

    var decodedData = await networkHelper.getData();
    return decodedData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = new NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=7ae534c3dc8e5ffc15f22533a0f91e11");
    var decodedData = await networkHelper.getData();

    return decodedData;
  }

  Map getImageAndText(int temp) {
    if (temp > 25) {
      imageAndText['image'] = "images/bg.jpg";
      imageAndText['text'] = "Time for an Ice Cream !";
      imageAndText['color'] = Colors.teal;
      return imageAndText;
    } else if (temp > 14) {
      imageAndText['image'] = "images/spring.jpg";
      imageAndText['text'] = "Time for tees and shorts !";
      imageAndText['color'] = Colors.yellow;
      return imageAndText;
    } else {
      imageAndText['image'] = "images/winter.jpg";
      imageAndText['text'] = "Time for coats and blazers !";
      imageAndText['color'] = Colors.black;
      return imageAndText;
    }
  }

}