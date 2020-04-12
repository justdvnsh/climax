import 'package:climax/networking/NetworkHelper.dart';
import 'package:climax/screens/LocationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climax/networking/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;
  String temp;
  String description;
  String city;

  void getLocationAndData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = new NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=7ae534c3dc8e5ffc15f22533a0f91e11");
    var decodedData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData: decodedData);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocationAndData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
