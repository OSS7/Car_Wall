import 'package:carwall/featured/auth/login/cubit/login_cubit.dart';
import 'package:carwall/featured/auth/signup/cubit/signup_cubit.dart';
import 'package:carwall/featured/car/car_details/cubit/car_details_cubit.dart';
import 'package:carwall/featured/car/cars/bloc/car_bloc.dart';
import 'package:carwall/featured/services/cubit/service_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton(() => CarBloc());
  getIt.registerLazySingleton(() => CarDetailsCubit());
  getIt.registerLazySingleton(() => ServiceCubit());
  getIt.registerLazySingleton(() => LoginCubit());
  getIt.registerLazySingleton(() => SignupCubit());
}
