import 'package:latlong2/latlong.dart';

class RequestModel {
  String name;
  String phoneNumber;
  String? service;
  LatLng? location;
  DateTime? checkDate;
  DateTime createdDate;

  RequestModel({
    required this.name,
    required this.phoneNumber,
    this.service,
    this.location,
    this.checkDate,
    required this.createdDate,
  });

  Map<String, Object> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      if (service != null) 'service': service ?? '',
      if (location != null)
        'location': "${location?.longitude}, ${location?.latitude}",
      if (checkDate != null) 'check_date': checkDate.toString(),
      'create_date': createdDate.toString(),
    };
  }
}
