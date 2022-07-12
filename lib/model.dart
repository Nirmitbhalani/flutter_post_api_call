import 'dart:convert';
SetupProfile setupProfileFromJson(String str) => SetupProfile.fromJson(json.decode(str));
String setupProfileToJson(SetupProfile data) => json.encode(data.toJson());
class SetupProfile {
    SetupProfile({
        required this.message,
        required this.user,
    });
    String? message;
    User? user;
    factory SetupProfile.fromJson(Map<String, dynamic> json) => SetupProfile(
        message: json['message']??'',
        user: User.fromJson(json['user']??''),
    );
    Map<String, dynamic> toJson() => {
        'message': message!,
        'user': user!.toJson(),
    };
}
class User {
    User({
        required this.id,
        required this.dob,
        required this.email,
        required this.phoneNumber,
        required this.tutorId,
        required this.password,
        required this.profilePicture,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.loginToken,
        required this.degree,
        required this.gender,
        required this.name,
        required this.surname,
    });
    String? id;
    DateTime? dob;
    String? email;
    String? phoneNumber;
    String? tutorId;
    String? password;
    String? profilePicture;
    bool? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? loginToken;
    String? degree;
    String? gender;
    String? name;
    String? surname;
    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id']??'',
        dob: DateTime.parse(json['dob']??''),
        email: json['email']??'',
        phoneNumber: json['phoneNumber']??'',
        tutorId: json['tutorId']??'',
        password: json['password']??'',
        profilePicture: json['profilePicture']??'',
        status: json['status']??'',
        createdAt: DateTime.parse(json['createdAt']??''),
        updatedAt: DateTime.parse(json['updatedAt']??''),
        v: json['__v']??'',
        loginToken: json['loginToken']??'',
        degree: json['degree']??'',
        gender: json['gender']??'',
        name: json['name']??'',
        surname: json['surname']??'',
    );
    Map<String, dynamic> toJson() => {
        '_id': id!,
        'dob': dob!.toIso8601String(),
        'email': email!,
        'phoneNumber': phoneNumber!,
        'tutorId': tutorId!,
        'password': password!,
        'profilePicture': profilePicture!,
        'status': status!,
        'createdAt': createdAt!.toIso8601String(),
        'updatedAt': updatedAt!.toIso8601String(),
        '__v': v!,
        'loginToken': loginToken!,
        'degree': degree!,
        'gender': gender!,
        'name': name!,
        'surname': surname!,
    };
}