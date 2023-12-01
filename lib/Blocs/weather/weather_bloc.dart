import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/current_condition.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Repositry/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({ this.repository}) : super(LoadingState()) {
    on<WeatherInitialFeatchEvent>(weatherInitialFeatchEvent);
    // on<ButtonTapEvent>(buttonTapEvent);
  }
  final Repository? repository;
  late final WeatherModel? weatherModel;
  CurrentCondition? condition;
  List<CurrentCondition>? conditionList;
  FutureOr<void> weatherInitialFeatchEvent(WeatherInitialFeatchEvent event, Emitter<WeatherState> emit)async {
   
    emit(LoadingState());

    conditionList =  await repository!.weatherConditions();
    weatherModel = await repository!.getWeatherModel('Kerala');
    // print(weatherModel!.);
    condition = conditionList!.firstWhere((element) => element.code == weatherModel!.currentWeather!.condition!.code);
    emit(WeatherFeatched(currentCondition: condition, weatherModel: weatherModel,));

    
  }
}


