import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LocationScreen extends StatefulWidget {

  final weatherData;

  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String temp;
  String description;
  String city;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var data = widget.weatherData;

    temp = data['main']['temp'].toString();
    city = data['name'].toString();
    description = data['weather'][0]['main'].toString();

    print(temp);
    print(city);
    print(description);
  }

  @override
  Widget build(BuildContext context) {
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

