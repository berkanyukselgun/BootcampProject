// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 0;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      url: fields[3] as String?,
      content: fields[4] as String?,
      start: fields[5] as String?,
      end: fields[6] as String?,
      isFree: fields[7] as bool?,
      phone: fields[8] as String?,
      email: fields[9] as String?,
      posterUrl: fields[10] as String?,
      markerIcon: fields[11] as String?,
      ticketUrl: fields[12] as String?,
      hashtag: fields[13] as String?,
      webUrl: fields[14] as String?,
      liveUrl: fields[15] as String?,
      androidUrl: fields[16] as String?,
      iosUrl: fields[17] as String?,
      format: fields[18] as Format?,
      category: fields[19] as Format?,
      venue: fields[20] as Venue?,
      tags: (fields[21] as List?)?.cast<Format>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.start)
      ..writeByte(6)
      ..write(obj.end)
      ..writeByte(7)
      ..write(obj.isFree)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.posterUrl)
      ..writeByte(11)
      ..write(obj.markerIcon)
      ..writeByte(12)
      ..write(obj.ticketUrl)
      ..writeByte(13)
      ..write(obj.hashtag)
      ..writeByte(14)
      ..write(obj.webUrl)
      ..writeByte(15)
      ..write(obj.liveUrl)
      ..writeByte(16)
      ..write(obj.androidUrl)
      ..writeByte(17)
      ..write(obj.iosUrl)
      ..writeByte(18)
      ..write(obj.format)
      ..writeByte(19)
      ..write(obj.category)
      ..writeByte(20)
      ..write(obj.venue)
      ..writeByte(21)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FormatAdapter extends TypeAdapter<Format> {
  @override
  final int typeId = 1;

  @override
  Format read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Format(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Format obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VenueAdapter extends TypeAdapter<Venue> {
  @override
  final int typeId = 2;

  @override
  Venue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Venue(
      id: fields[0] as int?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      about: fields[3] as String?,
      lat: fields[4] as String?,
      lng: fields[5] as String?,
      phone: fields[6] as String?,
      webUrl: fields[7] as String?,
      facebookUrl: fields[8] as String?,
      twitterUrl: fields[9] as String?,
      city: fields[10] as Format?,
      district: fields[11] as Format?,
      neighborhood: fields[12] as Format?,
      address: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Venue obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.about)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.lng)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.webUrl)
      ..writeByte(8)
      ..write(obj.facebookUrl)
      ..writeByte(9)
      ..write(obj.twitterUrl)
      ..writeByte(10)
      ..write(obj.city)
      ..writeByte(11)
      ..write(obj.district)
      ..writeByte(12)
      ..write(obj.neighborhood)
      ..writeByte(13)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VenueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
