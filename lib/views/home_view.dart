import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
//import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Weather App",
          style: TextStyle( fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>
        (builder: (context,state)
        {
          if (state is WeatherInitialState)
            {
              return NoWeatherBody();
            }
          else if (state is WeatherSuccessState)
          {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
            
          }
          else
            {
              return Text('oops there was an error');
            }

        },
      )

    );
  }
}
