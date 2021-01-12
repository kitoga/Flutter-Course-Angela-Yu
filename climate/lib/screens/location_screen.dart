import 'package:climate/screens/city_screen.dart';
import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climate/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  //Passing the weatheData through this location --go to loading_screen.dart
  LocationScreen({this.location});
  final location;


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

// TAPPING from thing in the weather.dart ......
  WeatherModel weather = WeatherModel();
  int temperature;
  //int condition; changed to code below
  String weatherIcon;
  String weatherMessage;
  String cityName;

  @override
  void initState() {
    super.initState();
    
//to tap into the weather data
    updateUI(widget.location);
  }

  void updateUI(dynamic getWeather){
    setState(() {
    if(getWeather == null){
      temperature = 0;
      weatherIcon='Error';
      weatherMessage= 'Unable to get weather data';
      cityName = '';
      return;
    }
    double temp = getWeather['main']['temp'];
    //from double to int 
    temperature = temp.toInt();
    weatherMessage = weather.getMessage(temperature);

    //condition now has a varible "var"
    var condition = getWeather['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);

    cityName = getWeather['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        //constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      var weatherData = weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                      if(typedName != null){
                        var weatherData = await weather.getCityWeather (typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon.toString(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

      