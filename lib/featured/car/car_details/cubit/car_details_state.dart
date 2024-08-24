part of 'car_details_cubit.dart';

@immutable
sealed class CarDetailsState {}

final class CarDetailsInitial extends CarDetailsState {}

final class CarDetailsLoadingState extends CarDetailsState {}

final class CarDetailsSuccessfulState extends CarDetailsState {}

final class CarDetailsErrorState extends CarDetailsState {}
