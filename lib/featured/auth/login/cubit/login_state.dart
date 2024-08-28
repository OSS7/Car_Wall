part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class SignupInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessfulState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
