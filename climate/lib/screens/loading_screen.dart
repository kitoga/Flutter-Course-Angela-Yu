import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const spinkit = SpinKitWave(
  color: Colors.white,
  size: 50.0,
);


//import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

//To have access to our current latitude and longitude
  // double latitute;
  // double longitude;

  void initState() { 
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    // weatherModel = WeatherModel(); this or the code below
    var getWeather = await WeatherModel().getLocationWeather();

//Passing the weatherData to the location screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(location: getWeather,)));
  }
 
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}


