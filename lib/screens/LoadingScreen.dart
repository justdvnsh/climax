import 'package:climax/helper/weather.dart';
import 'package:climax/screens/LocationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationAndData() async {

    var decodedData = await weather().getWeatherData();

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
