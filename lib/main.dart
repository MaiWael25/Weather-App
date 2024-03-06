import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) =>
              BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      primarySwatch: getThemeColor(
                        BlocProvider
                            .of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition,
                      ),
                    ),
                    home: HomeView(),
                    debugShowCheckedModeBanner: false,
                  );
                },
              ),
        )
    );
  }


}


MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
  // Group: Clear
    case 'Sunny':
    case 'Clear':
    case 'Partly cloudy':
      return Colors.orange;

  // Group: Cloudy
    case 'Overcast':
    case 'Mist':
      return Colors.blueGrey;

  // Group: Rainy
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Patchy light rain':
    case 'Patchy light drizzle':
    case 'Light showers of ice pellets':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain with thunder':
      return Colors.lightBlue;

  // Group: Snowy
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.blueGrey;

  // Group: Sleet
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey;

  // Group: Thunderstorm
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;

  // Group: Foggy
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

  // Group: Drizzle
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.blue;

  // Group: Freezing
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;

  // Group: Blowing
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.red;

  // Group: Ice pellets
    case 'Ice pellets':
      return Colors.lightBlue;

  // Group: Showers
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.lightBlue;

  // Group: Showers with Thunder
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

  // Group: Light Sleet
    case 'Light sleet':
    case 'Light sleet showers':
      return Colors.blueGrey;

  // Group: Moderate or heavy Sleet
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey;

  // Group: Light Snow
    case 'Patchy light snow':
    case 'Light snow':
    case 'Light snow showers':
    case 'Patchy light snow with thunder':
      return Colors.blueGrey;

  // Group: Moderate Snow
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy snow with thunder':
      return Colors.blueGrey;

    default:
      return Colors.grey;
  }
}
