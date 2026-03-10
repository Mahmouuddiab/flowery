import 'package:flower_app/features/profile/domain/entity/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.gender,
    required super.phone,
    required super.photo,
    required super.role,
    required super.wishlist,
    required super.addresses,
    required super.createdAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      photo: json['photo'],
      role: json['role'],
      wishlist: json['wishlist'] ?? [],
      addresses: json['addresses'] ?? [],
      createdAt: json['createdAt'],
    );
  }

}