import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String name;
  final String? phoneNumber;
  final int? age;
  final String email;

  const UserModel({
    this.id,
    required this.name,
    this.phoneNumber,
    this.age,
    required this.email,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'],
      age: json['age'],
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      'age': age,
      'email': email,
    };
  }

  
  UserModel copyWith({
  String? id,
  String? name,
  String? phoneNumber,
  int? age,
  String? email,
}) {
  return UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    age: age ?? this.age,
    email: email ?? this.email,
  );
}

  @override
  List<Object?> get props => [id, name, phoneNumber, age, email];
}
