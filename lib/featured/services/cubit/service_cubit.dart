import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../core/config/injectable_cofig.dart';
import '../model/service_model.dart';

part 'service_state.dart';

ServiceCubit get serviceCubit => getIt<ServiceCubit>();

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());

  List<ServiceModel> _services = [];
  List<ServiceModel> get services => _services;

  void getServices() async {
    emit(ServiceLoadingState());
    try {
      var _ref = await FirebaseFirestore.instance.collection('services').get();

      _services =
          _ref.docs.map((doc) => ServiceModel.fromDocument(doc)).toList();
      emit(ServiceSuccessfulState());
    } catch (e) {
      print('--------------------------$e');
      emit(ServiceErrorState(message: e.toString()));
    }
  }
}
