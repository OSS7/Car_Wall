import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/car_model.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc() : super(CarInitialState());

  Stream<CarState> mapEventToState(CarEvent event) async* {
    if (event is GetCars) {
      yield CarsLoadingState();
      try {
        // Simulate API call with dummy data
        await Future.delayed(const Duration(seconds: 2));
        final cars = [
          CarModel(id: 1, brand: 'Toyota', model: 'Camry'),
          CarModel(id: 2, brand: 'Honda', model: 'Civic'),
          CarModel(id: 3, brand: 'Ford', model: 'Mustang'),
        ];
        yield CarsLoadedState(cars: cars);
      } catch (error) {
        yield CarsErrorState(message: error.toString());
      }
    }
  }
}
