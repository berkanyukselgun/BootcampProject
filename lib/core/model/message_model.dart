import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  SentBy? sentBy;
  dynamic content;
  Timestamp? time;

  String? type;
  MessageModel({this.sentBy, this.content, this.type, this.time});

  MessageModel.fromJson(Map<String, dynamic> json) {
    sentBy = json['sent_by'] != null ? SentBy.fromJson(json['sent_by']) : null;
    content = json['content'] ?? '';
    type = json['type'] ?? '';
    time = json['time'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.sentBy != null) {
      data['sent_by'] = this.sentBy!.toJson();
    }
    data['content'] = this.content;
    data['type'] = this.type;
    data['time'] = this.time;
    return data;
  }
}

class SentBy {
  String? fullname;
  String? photoUrl;
  String? id;
  SentBy({this.fullname, this.photoUrl, this.id});

  SentBy.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    fullname = json['fullname'] ?? '';
    photoUrl = json['photo_url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['photo_url'] = this.photoUrl;
    return data;
  }
}
