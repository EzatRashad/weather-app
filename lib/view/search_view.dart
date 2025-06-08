






// ignore_for_file: use_build_context_synchronously




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';





class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Search City',),
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) {  
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context); 
              getweathercubit.getweather(cityNam: value);
              Navigator.pop(context); 
             },
            decoration:InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: 'search',
              suffixIcon: const Icon(Icons.search),
              hintText: 'Enter city name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                // borderSide: const BorderSide(
                //   color: Colors.green,
                // )
              )
            ) ,
          ),
        ),
      ),
    );
  }
}
