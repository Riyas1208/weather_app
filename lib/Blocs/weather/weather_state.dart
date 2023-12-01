part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

sealed class WeatherActionState extends WeatherState{}

final class LoadingState extends WeatherState {}

final class WeatherFeatched extends WeatherState {
  final WeatherModel? weatherModel;

  final CurrentCondition? currentCondition;
  WeatherFeatched(
    {
   required this.weatherModel, 

   this.currentCondition
  }
  );
}

