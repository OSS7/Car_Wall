import 'package:carwall/featured/car/cars/cars_view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../constant/routes.dart';

final _routingTransition = Transition.fadeIn;
final isLTR = Get.locale?.languageCode.contains('en') ?? true;
List<GetPage> getPages = [
  GetPage(
    name: MyRoutes.CARS,
    page: CarsView.new,
    transition: _routingTransition,
  ),
];
