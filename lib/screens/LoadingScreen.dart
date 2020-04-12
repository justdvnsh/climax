import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climax/networking/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocation();
  }

  void getData() async {
    http.Response response = await http.get("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=7ae534c3dc8e5ffc15f22533a0f91e11");
    if (response.statusCode == 200) {
      try {
        print(response.body);
        temp = json.decode(response.body)['main']['temp'].toString();
        description = json.decode(response.body)['weather'][0]['main'].toString();
        city = json.decode(response.body)['name'].toString();
        print(temp);
        print(description);
        print(city);
      } catch (e) {
        print(e);
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      CupertinoIcons.location_solid,
                      size: 50.0,
                    ),
                    onPressed: () {
//                    getLocation();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  child: Text(
                    "$temp Deg.",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 70.0
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    child: Text(
                      "$description",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 45.0
                      ),
                    ),
                  ),
                  Text(
                    "|",
                    style: TextStyle(
                        fontSize: 40.0
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    child: Text(
                      "$city",
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
