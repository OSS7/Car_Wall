part of 'car_bloc.dart';

sealed class CarEvent {
  @override
  List<Object> get props => [];
}

class GetCarsEvent extends CarEvent {}

class SearchCarsEvent extends CarEvent {
  final String text;
  SearchCarsEvent(this.text);
}

class SetHomeSelectEvent extends CarEvent {
  @override
  List<Object> get props => [];
}

class GetHomeAPIEvent extends CarEvent {
  GetHomeAPIEvent();
}
