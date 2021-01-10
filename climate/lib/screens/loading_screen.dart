import 'package:climate/services/location.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  

  void initState() { 
    super.initState();
    getLocation();
  }

  void getLocation()async{
    Location location = Location(); 
    await location.getCurrentLocation();
    print(location.latitute);
    print(location.longitude);
  }
  // void getLocation() async{
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  //   print(position);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
