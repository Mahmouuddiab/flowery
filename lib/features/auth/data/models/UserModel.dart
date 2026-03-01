class UserModel {
  UserModel({
    this.message,
    this.user,
    this.token,
  });

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.id,
    this.addresses,
    this.createdAt,
  });

  User.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    role = json['role'];
    wishlist = json['wishlist'] != null
        ? List<dynamic>.from(json['wishlist'])
        : [];

    id = json['_id'];

    addresses = json['addresses'] != null
        ? List<dynamic>.from(json['addresses'])
        : [];

    createdAt = json['createdAt'];
  }

  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  String? id;
  List<dynamic>? addresses;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['role'] = role;
    map['wishlist'] = wishlist;
    map['_id'] = id;
    map['addresses'] = addresses;
    map['createdAt'] = createdAt;
    return map;
  }
}