import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService
{
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '69d780f6b54746aeb25145457240603';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather( {required  String cityName}) async
   {
    try {
      Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    }   on DioException catch (e) {
     final String errorMessage =  e.response?.data['error']['message'] ?? 'there was an error, try later ';
      throw Exception(errorMessage);

    }
    catch(e)
     {
       log(e.toString());
       throw Exception('oops there was an error, try  later');
     }
  }

}