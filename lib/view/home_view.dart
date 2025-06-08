import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/view/search_view.dart';

import 'package:weather/widgets/noweather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

//import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Weathar App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(BuildContext){
              return const SearchView();
            } ),
            );
                    
          }, 
          icon:const Icon(Icons.search),
          ),
        ],
      ) ,
      body: BlocBuilder<GetWeatherCubit,WeatherState >(
        builder: (context , State ){
          if(State is WeatherInitialState){
            return const Center(child: CircularProgressIndicator(),);
          }else if(State is WeatherLOadedstate){
            return  WeatherInfoBody(
              weather: State.weathermodel ,
            );
          }else {
            return const Text('opps there was on error');
          }
        },
      )
    
    );
  }
}