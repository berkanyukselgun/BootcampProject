import 'package:hive_flutter/hive_flutter.dart';
import '../constants/memory/hive_box_names.dart';
import '../model/event_model.dart';

class HiveManager {
  HiveManager._();
  static late final HiveManager instance = HiveManager._();

  Future<void> initialize() async {
    registerAdaptor();
    await openBoxes();
  }

  void registerAdaptor() {
    Hive.registerAdapter(EventModelAdapter());
    Hive.registerAdapter(FormatAdapter());
    Hive.registerAdapter(VenueAdapter());
  }

  Future<void> openBoxes() async {
    _eventsBox = await Hive.openBox<EventModel>(HiveBoxNames.EVENTS.toString());
    _favouritesBox = await Hive.openBox(HiveBoxNames.FAVOURITES.toString());
    _groupsBox = await Hive.openBox(HiveBoxNames.GROUPS.toString());
    _categoriesBox = await Hive.openBox(HiveBoxNames.CATEGORIES.toString());
  }

  Box? _eventsBox;
  Box? get eventsBox => _eventsBox;
  void setEvents(Box? events) {
    this._eventsBox = events;
  }

  Box? _favouritesBox;
  Box? get favouritesBox => _favouritesBox;
  void setFavourites(Box? favourites) {
    this._favouritesBox = favourites;
  }

  Box? _groupsBox;
  Box? get groupsBox => _groupsBox;
  void setGroups(Box? groups) {
    this._groupsBox = groups;
  }

  Box? _categoriesBox;
  Box? get categoriesBox => _categoriesBox;
  void setCategories(Box? categories) {
    this._categoriesBox = categories;
  }

  Future<void> addEvent(EventModel event) async {
    await eventsBox?.add(event);
  }

  List<EventModel> getAllEvents() {
    return eventsBox?.values.cast<EventModel>().toList() ?? [];
  }

  List<Format> getAllCategories() {
    return categoriesBox?.values.cast<Format>().toList() ?? [];
  }

  EventModel? getEvent(int eventId) {
    return eventsBox?.get(eventId);
  }

  Future<void> deleteEvent(int eventId) async {
    await eventsBox?.delete(eventId);
  }
}
