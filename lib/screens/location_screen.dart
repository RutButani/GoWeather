

import 'package:flutter/material.dart';


import 'dart:convert';



class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String condition;
  String cityName;
  int humidity;
  int windSpeed;


  void initState()
  {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null)
        {
          temperature=0;
          humidity=0;
          return;
        }
      double temp =weatherData['main']['temp']-273.15;
      temperature=temp.toInt();
      condition = weatherData['weather'][0]['description'];
      cityName = weatherData['name'];
      humidity=weatherData['main']['humidity'];
      humidity=weatherData['main']['humidity'];
      double speed= weatherData['wind']['speed'];
      windSpeed=speed.toInt();


    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/app.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '$cityName',
                        style: TextStyle(
                          fontSize: 90.0,
                        ),
                        //style: kConditionTextStyle,
                      ),
                      Text(
                        '$temperature°',
                        // style: kTempTextStyle,
                        style: TextStyle(
                          fontSize: 90.0,
                        ),
                      ),
                      Text(
                        'HUMIDITY: $humidity rh',
                        // style: kTempTextStyle,
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                      Text(
                        'WINDSPEED: $windSpeed kn',
                        // style: kTempTextStyle,
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),

                    ],
                  ),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}




