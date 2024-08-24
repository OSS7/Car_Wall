import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String id;
  String name;
  String formType;

  ServiceModel({
    required this.id,
    required this.name,
    required this.formType,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      formType: json['form_type'],
    );
  }

  factory ServiceModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServiceModel(
      id: data['id'],
      name: data['name'],
      formType: data['form_type'],
    );
  }
}
