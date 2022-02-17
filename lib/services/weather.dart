import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
const apiKey = '6ca51c8800f6898a7ae68786bd704413';
const openWeatherURL='http://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName)async{
    var url='$openWeatherURL?q=$cityName&APPID=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData= await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async {
    Location myLoc = new Location();
    await myLoc.getCurrentLocation();

    NetworkHelper networkHelper=NetworkHelper(('$openWeatherURL?lat=${myLoc.latitude}&lon=${myLoc.longitude}&APPID=$apiKey&units=metric'));
    var weatherData=await networkHelper.getData();
    return weatherData;
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
