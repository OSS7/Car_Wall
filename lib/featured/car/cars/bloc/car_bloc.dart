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

  List<String>? _types;
  List<String>? get types => _types;

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

          _types = _cars.map((e) => e.name.split(' ')[0]).toList();
          _types?.insert(0, 'All');
          print(_types);
        } catch (e) {
          print('---------------$e');
          emit(CarsErrorState(message: e.toString()));
        }
        emit(CarsDoneState());
      },
    );

    on<SearchCarsEvent>(
      (event, emit) async {
        emit(CarsLoadingState());
        try {
          CollectionReference cars =
              FirebaseFirestore.instance.collection('cars');
          print('event.text');
          print(event.text);
          final response = await cars
              .orderBy("name")
              .startAt([event.text]).endAt(['${event.text}\uf8ff']).get();
          _cars =
              response.docs.map((doc) => CarModel.fromDocument(doc)).toList();
          _cars.forEach((e) => print(e));
        } catch (e) {
          print('---------------$e');
          emit(CarsErrorState(message: e.toString()));
        }
        emit(CarsDoneState());
      },
    );
  }
}
