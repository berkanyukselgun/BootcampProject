import 'package:akademi_bootcamp/core/base/extensions/html_parser.dart';
import 'package:akademi_bootcamp/core/constants/text/text_constants.dart';
import 'package:akademi_bootcamp/core/model/expanded_item.dart';
import 'package:akademi_bootcamp/core/model/user_model.dart';
import 'package:akademi_bootcamp/core/services/auth/auth_service.dart';
import 'package:akademi_bootcamp/core/services/firestore/events_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/model/event_model.dart';
part 'detail_view_model.g.dart';

class DetailViewModel = _DetailViewModelBase with _$DetailViewModel;

abstract class _DetailViewModelBase with Store {
  List<Color> gradientColors = [
    Color(0xff323232),
    Color(0xff323232),
    Color(0xff323232),
    Color(0xff323232),
    Color(0xff323232).withOpacity(0.99),
    Color(0xff323232).withOpacity(0.95),
    Color(0xff323232).withOpacity(0.89),
    Color(0xff323232).withOpacity(0.82),
    Color(0xff323232).withOpacity(0.74),
    Color(0xff323232).withOpacity(0.65),
    Color(0xff323232).withOpacity(0.55),
    Color(0xff323232).withOpacity(0.44),
    Color(0xff323232).withOpacity(0.32),
    Color(0xff323232).withOpacity(0.19),
    Color(0xff323232).withOpacity(0.05),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
    Color(0xff323232).withOpacity(0),
  ];
  @observable
  List<EventModel> favList = [];
  @observable
  bool isFav = false;
  bool anon = AuthService.instance.uid == null;

  @observable
  List<EventExpandedItem> items = ObservableList<EventExpandedItem>();

  @action
  changeExpansion(int index, bool isExpanded) {
    items[index].isExpanded = !isExpanded;
  }

  @action
  Future<void> favButton(EventModel event) async {
    if (!isFav) {
      isFav = true;
      await EventsService.instance.updateUserFavList(event, true);
    } else {
      isFav = false;
      await EventsService.instance.updateUserFavList(event, false);
    }
  }

  @action
  init(EventModel eventModel) {
    UserModel? currentUser = AuthService.instance.currentUser;
    if (currentUser != null) {
      favList = currentUser.favEvents ?? [];
    }
    isFav = favList.any((event) => event.id == eventModel.id);
    items = [
      EventExpandedItem(headerValue: TextConstants.eventInfo, expandedValue: eventModel.content != null ? eventModel.content.toString().parseHtml() : ""),
      EventExpandedItem(
          headerValue: TextConstants.placeInfo,
          expandedValue: (eventModel.venue != null && eventModel.venue!.about != null ? eventModel.venue!.about.toString() : "") +
              '\n' +
              (eventModel.venue != null && eventModel.venue!.address != null ? eventModel.venue!.address.toString() : "")),
    ];
  }

  Future<void> goToTicketSelling(String? eventUrl) async {
    if (eventUrl != null) {
      final Uri uri = Uri.parse(eventUrl);
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $uri');
      }
    }
  }
}
