import 'package:carwall/featured/car/car_details/car_details_view.dart';
import 'package:carwall/featured/car/cars/cars_view.dart';
import 'package:carwall/featured/services/services_view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../constant/routes.dart';

const _routingTransition = Transition.fadeIn;
final isLTR = Get.locale?.languageCode.contains('en') ?? true;
List<GetPage> getPages = [
  GetPage(
    name: MyRoutes.CARS,
    page: CarsView.new,
    transition: _routingTransition,
  ),
  GetPage(
    name: MyRoutes.CAR_DETAILS,
    page: CarDetailsView.new,
    transition: _routingTransition,
  ),
  GetPage(
    name: MyRoutes.SERVICES,
    page: ServicesView.new,
    transition: _routingTransition,
  ),
  GetPage(
    name: MyRoutes.ON_BOARDING,
    page: ServicesView.new,
    transition: _routingTransition,
  ),
];
