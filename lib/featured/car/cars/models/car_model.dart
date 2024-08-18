import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
  final String name;
  final int price;
  final double rate;
  final String type;
  final String image;


  CarModel({
    required this.name,
    required this.price,
    required this.rate,
    required this.type,
    required this.image,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      name: json['name'],
      price: json['price'],
      rate: json['rate'],
      type: json['type'],
      image: json['image'],
    );
  }
  factory CarModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CarModel(
      name: data['name'],
      price: data['price'],
      rate: data['rate'],
      type: data['type'],
      image: data['image'],
    );
  }

  Map<String, Object> toJson(){
    return {
      'name': name,
      'price': price,
      'rate': rate,
      'type': type,
      'image': image,
    };
  }
}
