import 'package:bloc/bloc.dart';
import 'package:carwall/core/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/config/injectable_cofig.dart';
import '../../../../core/widgets/custom_snack_bars.dart';

part 'login_state.dart';

LoginCubit get loginCubit => getIt<LoginCubit>();

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(SignupInitialState());

  Future<void> loginWithFirebase(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.toNamed(MyRoutes.CARS);
      CustomSnackBar.showCustomToast(
          message: 'login-done', title: 'successfully logged in');
      emit(LoginSuccessfulState());
    } on FirebaseException catch (e) {
      CustomSnackBar.showCustomErrorToast(message: e.code);
      emit(LoginErrorState(e.message ?? 'An error occurred'));
    }
  }
}
