// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:akademi_bootcamp/core/constants/api/api_constants.dart';
import 'package:akademi_bootcamp/core/constants/image/image_constants.dart';
import 'package:akademi_bootcamp/core/model/event_model.dart';
import 'package:http/http.dart' as http;

class EtkinlikIOService {
  EtkinlikIOService._();
  static late final EtkinlikIOService instance = EtkinlikIOService._();
  late EventService eventService;
  List<Format> categoryList = [];
  Map<String, String> headers = {'Content-Type': 'application/json', 'Accept': 'application/json', 'X-Etkinlik-Token': ApiConstants.ETKINLIKIO_TOKEN};

  Future<List<EventModel>?> fetchEventList() async {
    try {
      var response = await http.get(Uri.parse(ApiConstants.BASE_URL + '/events?city_ids=40'), headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        eventService = EventService.fromJson(jsonResponse);
        if (eventService != null && eventService.eventList != null) {
          for (EventModel event in eventService.eventList!) {
            if (event.format != null && categoryList.every((format) => format.id != event.format!.id)) {
              categoryList.add(event.format!);
            }
            event.markerIcon = setCategoryIcons(event);
          }
        }
        return eventService.eventList;
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  String setCategoryIcons(EventModel eventModel) {
    switch (eventModel.format?.id) {
      case 28 || 15 || 5:
        return ImageConstants.WORKSHOP;
      case 21:
        return ImageConstants.FESTIVAL;
      case 4:
        return ImageConstants.FAIR;
      case 10:
        return ImageConstants.TRIP;
      case 22:
        return ImageConstants.SIGNING_DAY;
      case 11:
        return ImageConstants.CAMP;
      case 2 || 8 || 9 || 3 || 20 || 14 || 27 || 13 || 16:
        return ImageConstants.CONFERENCE;
      case 19:
        return ImageConstants.CONCERT;
      case 7:
        return ImageConstants.THEATRE;
      case 1:
        return ImageConstants.EXHIBITION;
      case 12:
        return ImageConstants.COMPETITION;
      default: //diğer id 24 //TODO CHANGE
        return ImageConstants.HOME;
    }
  }
}
