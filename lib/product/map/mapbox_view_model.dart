import 'package:akademi_bootcamp/core/model/group_model.dart';
import 'package:akademi_bootcamp/core/services/firestore/events_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import '../../core/memory/hive_manager.dart';
import '../../core/model/event_model.dart';
import 'mapbox_map_view.dart';
part 'mapbox_view_model.g.dart';

class MapBoxViewModel = _MapBoxViewModelBase with _$MapBoxViewModel;

abstract class _MapBoxViewModelBase with Store {
  final MAPBOX_STYLE = 'mapbox/dark-v10';
  final MARKER_SIZE_SHRINK = 80.0;
  final mapCenter = LatLng(41.0565767, 28.9511806);
  Position? currentPosition;

  @observable
  List<EventModel> eventList = [];
  @observable
  List<GroupModel> groupList = [];
  @observable
  List<Marker> markerList = [];
  @action
  void initPageController() {
    pageController.addListener(() {});
  }

  @observable
  PageController pageController = PageController();

  @observable
  int selectedIndex = -1;

  @action
  List<Marker> buildMarkers() {
    final List<Marker> _markerList = [];
    for (var i = 0; i < groupList.length; i++) {
      final mapItem = groupList[i];
      _markerList.add(Marker(
        height: MARKER_SIZE_SHRINK,
        width: MARKER_SIZE_SHRINK,
        point: LatLng(double.parse(mapItem.event?.venue?.lat ?? '0'), double.parse(mapItem.event?.venue?.lng ?? '0')),
        builder: (context) {
          return GestureDetector(onTap: () => onTap(i), child: LocationMarker(isSelected: i == selectedIndex, group: mapItem));
        },
      ));
    }
    return _markerList;
  }

  @action
  Future<void> onTap(int index) async {
    selectedIndex = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @action
  Future<void> getEventList() async {
    List<EventModel> allEvents = HiveManager.instance.getAllEvents();
    eventList = allEvents.where((event) => event.venue?.lat != null && event.venue?.lng != null).toList();

    List<String> docIds = eventList.map((event) => event.id.toString()).toList();
    groupList = await EventsService.instance.fetchSomeGroups(docIds);
  }

  @action
  init() async {
    initPageController();
    await getLocation();
    await getEventList();
    if (eventList.isNotEmpty) {
      selectedIndex = 0;
    }
    markerList = buildMarkers();
  }

  @action
  Future<void> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
