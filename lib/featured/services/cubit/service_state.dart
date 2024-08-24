part of 'service_cubit.dart';

@immutable
sealed class ServiceState {}

final class ServiceInitial extends ServiceState {}

final class ServiceLoadingState extends ServiceState {}

final class ServiceSuccessfulState extends ServiceState {}

final class ServiceErrorState extends ServiceState {
  final String message;

  ServiceErrorState({required this.message});
}
