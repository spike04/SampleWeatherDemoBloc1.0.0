import 'package:equatable/equatable.dart';
import 'package:weather_search_bloc/data/model/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {
  const WeatherInitialState();
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  const WeatherLoadedState(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  final String message;
  const WeatherErrorState(this.message);
  @override
  List<Object> get props => [message];
}
