import 'package:carwall/featured/car/car_details/cubit/car_details_cubit.dart';
import 'package:carwall/featured/car/cars/bloc/car_bloc.dart';
import 'package:carwall/featured/services/cubit/service_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton(() => CarBloc());
  getIt.registerLazySingleton(() => CarDetailsCubit());
  getIt.registerLazySingleton(() => ServiceCubit());
}
