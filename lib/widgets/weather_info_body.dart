import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';


class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather, });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
  WeatherModel weatherModel =   BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
   
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.condition),
            getThemeColor(weatherModel.condition)[300]!,
            getThemeColor(weatherModel.condition)[50]!
          ],
          begin:Alignment.topCenter,
          end: Alignment.bottomCenter ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(weatherModel.name,
                style: const TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 32,
                   ),
      ),
                 Text(
                  weatherModel.updated,
                style: const TextStyle(
                  fontSize: 24,
                ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Image.network(
                "https:${weatherModel.images}",
                ),
                Text(
                  '${weatherModel.avgtemp.round()}',
                style: const TextStyle(
                   fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                ),
                     Column(
                  children: [
                    Text(
                 "Maxtemp : ${ weatherModel.maxtemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                   "Mintemp : ${weatherModel.mintemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
    
                  ],
                ),
                 const SizedBox(
                  height: 32,
                ),
                 Text(
                   weatherModel.condition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 32,
              ),),
              ],
            ),
          
        
      ),
    );
  }
}

DateTime stringToDateTime(String value){
  return DateTime.parse(value);
} 

