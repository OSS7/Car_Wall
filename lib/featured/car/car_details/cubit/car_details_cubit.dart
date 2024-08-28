import 'package:bloc/bloc.dart';
import 'package:carwall/featured/car/cars/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../injectable_config.dart';

part 'car_details_state.dart';

CarDetailsCubit get carDetailsCubit => getIt<CarDetailsCubit>();

class CarDetailsCubit extends Cubit<CarDetailsState> {
  CarDetailsCubit() : super(CarDetailsInitial());

  CarModel? _car;
  CarModel? get car => _car;

  void getCarDetails(String car) async {
    emit(CarDetailsLoadingState());
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('cars');
      final response = await ref.where('name', isEqualTo: car).get();
      _car = response.docs.map((e) => CarModel.fromDocument(e)).first;
      emit(CarDetailsSuccessfulState());
    } catch (e) {
      print('================$e');
      emit(CarDetailsErrorState());
    }
  }
}
