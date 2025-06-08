import 'package:weather/models/weather_model.dart';

class WeatherState{}

class WeatherInitialState extends WeatherState{}

class WeatherLOadedstate extends WeatherState{
  final WeatherModel weathermodel;

  WeatherLOadedstate(this.weathermodel);
}

class WeatharFailureState extends WeatherState{
  final String errorMessage;

  WeatharFailureState(this.errorMessage);
}