import '../services/networking.dart';
import 'package:climate/services/location.dart';
class WeatherModel {

  Future<dynamic> getCityWeather(cityName)async{

    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=a3c5880752eda57a18f7d83eef1808ec&units=metric');

    //to gain Assests 
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
// We are getting current location for the code below.................
    Location location = Location(); 
    await location.getCurrentLocation();
//tapping from current latitute and longitude
    // latitute = location.latitute;
    // longitude = location.longitude;  
    
    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitute}&lon=${location.longitude}&appid=a3c5880752eda57a18f7d83eef1808ec&units=metric');

//We will use this object in the location_screen.dart for example getting the id / area / temperature........................
      var getWeather = await networkHelper.getData();
      return getWeather;
    }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
