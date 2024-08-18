import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../core/service/api_helper.dart';
import '../../../../injectable_config.dart';
import '../../../../main.dart';
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
          emit(CarsErrorState(message: e.toString()));
        }
        emit(CarsDoneState());
      },
    );
  }
}
