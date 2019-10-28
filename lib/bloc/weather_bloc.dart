import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_search_bloc/data/weather_repository.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository);

  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoadingState();
    if (event is GetWeather) {
      try {
        final weather = await weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoadedState(weather);
      } on NetworkError {
        yield WeatherErrorState(
            'Couldn\'t fetch weather. Is the device online?');
      }
    } else if (event is GetDetailWeather) {
      try {
        final weather =
            await weatherRepository.fetchDetailedWeather(event.cityName);
        yield WeatherLoadedState(weather);
      } on NetworkError {
        yield WeatherErrorState(
            'Couldn\'t fetch weather. Is the device online?');
      }
    }
  }
}
