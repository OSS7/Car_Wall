part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitialState extends CarState {}
final class CarsLoadingState extends CarState {}
class CarsLoadedState extends CarState {
  final List<CarModel> cars;

  CarsLoadedState({required this.cars});
}

final class CarsErrorState extends CarState {
  final String message;

  CarsErrorState({required this.message});
}
