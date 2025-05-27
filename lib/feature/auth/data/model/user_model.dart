import 'package:equatable/equatable.dart';

import '../../../../core/models/items_model.dart';

class UserModel extends Equatable {
  final String? id;
  final String name;
  final String? phoneNumber;
  final int? age;
  final String email;
  final Map<String, ItemsModel> carts;
  final Map<String, ItemsModel> orders;

  const UserModel({
    this.id,
    required this.name,
    this.phoneNumber,
    this.age,
    required this.email,
    required this.carts,
    required this.orders,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      age: json['age'] ?? 0,
      email: json['email'] ?? '',
      carts: (json['carts'] as Map<String, dynamic>? ?? {}).map(
        (key, value) => MapEntry(key, ItemsModel.fromJson(value)),
      ),
      orders: (json['orders'] as Map<String, dynamic>? ?? {}).map(
        (key, value) => MapEntry(key, ItemsModel.fromJson(value)),
      ),
    );
  }
  UserModel copyWith({
  String? id,
  String? name,
  String? phoneNumber,
  int? age,
  String? email,
  Map<String, ItemsModel>? carts,
  Map<String, ItemsModel>? orders,
}) {
  return UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    age: age ?? this.age,
    email: email ?? this.email,
    carts: carts ?? this.carts,
    orders: orders ?? this.orders,
  );
}

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      'age': age,
      'email': email,
      'carts': carts.map((key, value) => MapEntry(key, value.toJson())),
      'orders': orders.map((key, value) => MapEntry(key, value.toJson())),
    };
  }



  @override
  List<Object?> get props => [id, name, phoneNumber, age, email, carts, orders];
}

