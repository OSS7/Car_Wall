class CarModel {
  final int id;
  final String brand;
  final String model;

  CarModel({
    required this.id,
    required this.brand,
    required this.model,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
    );
  }
}