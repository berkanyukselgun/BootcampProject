import 'package:hive/hive.dart';
part 'event_model.g.dart';

class EventService {
  List<EventModel>? eventList;

  EventService({this.eventList});
  EventService.fromJson(Map json) {
    eventList = (json['items'] ?? []).map((element) => EventModel.fromJson(element)).toList().cast<EventModel>();
  }
}

@HiveType(typeId: 0)
class EventModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? slug;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? content;
  @HiveField(5)
  String? start;
  @HiveField(6)
  String? end;
  @HiveField(7)
  bool? isFree;
  @HiveField(8)
  String? phone;
  @HiveField(9)
  String? email;
  @HiveField(10)
  String? posterUrl;
  @HiveField(11)
  String? markerIcon;
  @HiveField(12)
  String? ticketUrl;
  @HiveField(13)
  String? hashtag;
  @HiveField(14)
  String? webUrl;
  @HiveField(15)
  String? liveUrl;
  @HiveField(16)
  String? androidUrl;
  @HiveField(17)
  String? iosUrl;
  @HiveField(18)
  Format? format;
  @HiveField(19)
  Format? category;
  @HiveField(20)
  Venue? venue;
  @HiveField(21)
  List<Format>? tags;

  EventModel(
      {this.id,
      this.name,
      this.slug,
      this.url,
      this.content,
      this.start,
      this.end,
      this.isFree,
      this.phone,
      this.email,
      this.posterUrl,
      this.markerIcon,
      this.ticketUrl,
      this.hashtag,
      this.webUrl,
      this.liveUrl,
      this.androidUrl,
      this.iosUrl,
      this.format,
      this.category,
      this.venue,
      this.tags});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    slug = json['slug'] ?? '';
    url = json['url'] ?? '';
    content = json['content'] ?? '';
    start = json['start'] ?? '';
    end = json['end'] ?? '';
    isFree = json['is_free'] ?? '';
    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
    posterUrl = json['poster_url'] ?? '';
    markerIcon = json['marker_icon'] ?? '';
    ticketUrl = json['ticket_url'] ?? '';
    hashtag = json['hashtag'] ?? '';
    webUrl = json['web_url'] ?? '';
    liveUrl = json['live_url'] ?? '';
    androidUrl = json['android_url'] ?? '';
    iosUrl = json['ios_url'] ?? '';
    format = json['format'] != null ? Format.fromJson(json['format']) : null;
    category = json['category'] != null ? Format.fromJson(json['category']) : null;
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    if (json['tags'] != null) {
      tags = <Format>[];
      json['tags'].forEach((v) {
        tags!.add(Format.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['url'] = this.url;
    data['content'] = this.content;
    data['start'] = this.start;
    data['end'] = this.end;
    data['is_free'] = this.isFree;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email'] = this.email;
    data['poster_url'] = this.posterUrl;
    data['marker_icon'] = this.markerIcon;
    data['ticket_url'] = this.ticketUrl;
    data['hashtag'] = this.hashtag;
    data['web_url'] = this.webUrl;
    data['live_url'] = this.liveUrl;
    data['android_url'] = this.androidUrl;
    data['ios_url'] = this.iosUrl;
    if (this.format != null) {
      data['format'] = this.format!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Format extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? slug;

  Format({this.id, this.name, this.slug});

  Format.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

@HiveType(typeId: 2)
class Venue extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? slug;
  @HiveField(3)
  String? about;
  @HiveField(4)
  String? lat;
  @HiveField(5)
  String? lng;
  @HiveField(6)
  String? phone;
  @HiveField(7)
  String? webUrl;
  @HiveField(8)
  String? facebookUrl;
  @HiveField(9)
  String? twitterUrl;
  @HiveField(10)
  Format? city;
  @HiveField(11)
  Format? district;
  @HiveField(12)
  Format? neighborhood;
  @HiveField(13)
  String? address;

  Venue({this.id, this.name, this.slug, this.about, this.lat, this.lng, this.phone, this.webUrl, this.facebookUrl, this.twitterUrl, this.city, this.district, this.neighborhood, this.address});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    lat = json['lat'];
    lng = json['lng'];
    phone = json['phone'];
    webUrl = json['web_url'];
    facebookUrl = json['facebook_url'];
    twitterUrl = json['twitter_url'];
    city = json['city'] != null ? Format.fromJson(json['city']) : null;
    district = json['district'] != null ? Format.fromJson(json['district']) : null;
    neighborhood = json['neighborhood'] != null ? Format.fromJson(json['neighborhood']) : null;
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['about'] = this.about;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['phone'] = this.phone;
    data['web_url'] = this.webUrl;
    data['facebook_url'] = this.facebookUrl;
    data['twitter_url'] = this.twitterUrl;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.neighborhood != null) {
      data['neighborhood'] = this.neighborhood!.toJson();
    }
    data['address'] = this.address;
    return data;
  }
}
