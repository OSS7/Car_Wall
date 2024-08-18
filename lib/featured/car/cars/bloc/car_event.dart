part of 'car_bloc.dart';

sealed class CarEvent {
  @override
  List<Object> get props => [];
}

class GetCarsEvent extends CarEvent {}

class SetHomeSelectEvent extends CarEvent {
  @override
  List<Object> get props => [];
}

class GetHomeAPIEvent extends CarEvent {
  GetHomeAPIEvent();
}
