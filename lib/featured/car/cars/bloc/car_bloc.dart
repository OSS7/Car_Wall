import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../injectable_config.dart';
import '../models/car_model.dart';

part 'car_event.dart';
part 'car_state.dart';

CarBloc get carsBloc => getIt<CarBloc>();

class CarBloc extends Bloc<CarEvent, CarState> {
  List<CarModel> _cars = [];

  List<CarModel> get cars => _cars;

  CarBloc() : super(CarInitialState()) {
    on<GetCarsEvent>(
      (event, emit) async {
        emit(CarsLoadingState());
        try {
          CollectionReference cars =
              FirebaseFirestore.instance.collection('cars');
          final response = await cars.get();
          _cars =
              response.docs.map((doc) => CarModel.fromDocument(doc)).toList();
        } catch (e) {
          print('---------------$e');
          emit(CarsErrorState(message: e.toString()));
        }
        emit(CarsDoneState());
      },
    );
  }
}
