import 'package:bloc/bloc.dart';
import 'package:carwall/core/constant/routes.dart';
import 'package:carwall/core/widgets/custom_snack_bars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../core/config/injectable_cofig.dart';

part 'signup_state.dart';

SignupCubit get signupCubit => getIt<SignupCubit>();

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signup(String email, String password) async {
    emit(SignupLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomSnackBar.showCustomToast(
          message: 'create-account-done',
          title: 'successfully created account');
      Get.toNamed(MyRoutes.LOGIN);
      emit(SignupSuccessfulState());
    } on FirebaseAuthException catch (e) {
      CustomSnackBar.showCustomErrorToast(message: e.code);
    }
  }
}
