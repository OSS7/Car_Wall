part of 'car_bloc.dart';


sealed class CarEvent {
  @override
  List<Object> get props => [];
}

class GetCars extends CarEvent{}
