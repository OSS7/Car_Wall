import 'package:bloc/bloc.dart';
import 'package:carwall/featured/services/model/request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../core/config/injectable_cofig.dart';
import '../../../core/widgets/custom_snack_bars.dart';
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
      var ref = await FirebaseFirestore.instance.collection('services').get();
      _services =
          ref.docs.map((doc) => ServiceModel.fromDocument(doc)).toList();
    } catch (e) {
      print('--------------------------$e');
      emit(ServiceErrorState(message: e.toString()));
    }
    emit(ServiceSuccessfulState());
  }

  void addServiceRequest(RequestModel request) {
    // if (chosenService != null) {
    FirebaseFirestore.instance.collection('requests').add(request.toJson());
    //   'name': request.name,
    // 'phone_number': request.phoneNumber,
    // 'service': request.service,
    // 'check_date': request.checkDate,
    // 'location': request.location,
    // 'created_date': DateTime.now().toIso8601String(),
    // } else {
    if (request.service == null) {
      CustomSnackBar.showCustomErrorSnackBar(
        message: 'Please Select a Service',
        title: 'Error',
      );
    }
  }
}
