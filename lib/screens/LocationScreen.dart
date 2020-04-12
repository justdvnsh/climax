import 'package:climax/helper/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'CityScreen.dart';

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
  weather weatherModel = weather();
  String image;
  String text;
  Color color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var data = widget.weatherData;

    int temperature = data['main']['temp'];
    temp = temperature.toString();
    city = data['name'].toString();
    description = data['weather'][0]['main'].toString();

    print(temp);
    print(city);
    print(description);

    image = weatherModel.getImageAndText(temperature)['image'];
    text = weatherModel.getImageAndText(temperature)['text'];
    color = weatherModel.getImageAndText(temperature)['color'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                            CupertinoIcons.create_solid,
                            size: 50.0,
                            color: this.color
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return CityScreen();
                          }));
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
                            fontSize: 70.0,
                            color: this.color
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
                              fontSize: 45.0,
                              color: this.color
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                            fontSize: 40.0,
                            color: this.color
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                        child: Text(
                          "$city",
                          style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: this.color
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
                  child: Text(
                    "$text",
                    style: TextStyle(
                        fontSize: 54.0,
                        fontWeight: FontWeight.w900,
                        color: this.color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

