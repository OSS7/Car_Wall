part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitialState extends CarState {}
final class CarsLoadingState extends CarState {}
final class CarsDoneState extends CarState {}
class CarsLoadedState extends CarState {
}

final class CarsErrorState extends CarState {
  final String message;

  CarsErrorState({required this.message});
}
