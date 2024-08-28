part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessfulState extends SignupState {}

final class SignupErrorState extends SignupState {
  final String error;
  SignupErrorState(this.error);
}
