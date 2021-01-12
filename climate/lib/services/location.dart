import 'package:geolocator/geolocator.dart';
class Location{

//location properties
  double longitude;
  double latitute;

  //Location({this.latitute, this.longitude});



//todo to get the current location   || (1) this was given by the geolocation package
  Future<void> getCurrentLocation() async{
    try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//todo (2)   testing geolocation to print current latitute and longitude    
    latitute = position.latitude;
    longitude = position.longitude;
    }catch (e){
      print(e); 
    }
  }


}