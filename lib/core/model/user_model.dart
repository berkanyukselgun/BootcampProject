import 'package:akademi_bootcamp/core/model/event_model.dart';

class UserModel {
  String? userID;
  String? fullname;
  String? birthdate;
  String? photoUrl;
  String? email;
  String? city;
  String? gender;
  bool? emailVerified;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? lastLogin;
  List<EventModel>? favEvents;

  UserModel(
      {this.userID,
      this.fullname,
      this.birthdate,
      this.photoUrl,
      this.email,
      this.city,
      this.gender,
      this.emailVerified,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.lastLogin,
      this.favEvents});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    userID = json['userID'];
    birthdate = json['birthdate'];
    photoUrl = json['photo_url'];
    email = json['email'];
    emailVerified = json['email_verified'];
    city = json['city'];
    gender = json['gender'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastLogin = json['last_login'];
    favEvents = (json['fav_events'] ?? []).map((element) => EventModel.fromJson(element)).toList().cast<EventModel>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['userID'] = this.userID;
    data['birthdate'] = this.birthdate;
    data['photo_url'] = this.photoUrl;
    data['city'] = this.city;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_login'] = this.lastLogin;
    data['fav_events'] = this.favEvents;
    return data;
  }
}
