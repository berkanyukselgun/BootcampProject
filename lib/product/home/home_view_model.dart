import 'package:akademi_bootcamp/core/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../core/memory/hive_manager.dart';
import '../../core/services/api/etkinlikIO_service.dart';
import '../../core/services/auth/auth_service.dart';
import '../detail_page/detail_view.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  ScrollController scrollController = ScrollController();
  TextEditingController searchTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @observable
  bool isLoading = true;

  @observable
  List<EventModel> eventList = [];

  void openDrawer(BuildContext context) {
    final ScaffoldState? scaffoldState = Scaffold.of(context);
    scaffoldState?.openDrawer();
  }

  @action
  Future<void> getEventsToLocalFromApi() async {
    isLoading = true;
    try {
      List<EventModel?> events = await EtkinlikIOService.instance.fetchEventList() ?? [];

      if (HiveManager.instance.eventsBox != null) {
        await HiveManager.instance.eventsBox!.clear();
        await HiveManager.instance.eventsBox!.addAll(events);
        await HiveManager.instance.categoriesBox!.clear();
        await HiveManager.instance.categoriesBox!.addAll(EtkinlikIOService.instance.categoryList);
      }
      await getEventList();
    } catch (e) {
      print('error $e');
    } finally {
      isLoading = false;
    }
  }

  @observable
  bool seeAllIsActive = false;

  @action
  seeAll() {
    seeAllIsActive = !seeAllIsActive;
  }

  @observable
  List<Format>? categoryList = [];

  @action
  init() async {
    await getEventList();
  }

  signOut() {
    AuthService.instance.signOut();
  }

  @action
  Future<void> getEventList() async {
    eventList = HiveManager.instance.getAllEvents();
    categoryList = HiveManager.instance.getAllCategories();
    if (categoryList != null && categoryList!.length > 0) {
      filterEventsByCategory(categoryList![selectedIndex]);
    }
    isLoading = false;
  }

  @observable
  List<EventModel>? filteredEventList;

  @observable
  bool isSearched = false;
  @action
  void filterEventsByCategory(Format selectedCategory) {
    filteredEventList = eventList.where((event) => event.format?.id == selectedCategory.id).toList();
  }

  @observable
  int selectedIndex = 0;

  @action
  bool isSelected(int index) => selectedIndex == index;

  @action
  void selectCategory(int index) {
    selectedIndex = index;
    filterEventsByCategory(categoryList![selectedIndex]);
  }

  @action
  void tapped(int index) {
    if (!isSelected(index)) {
      selectCategory(index);
      if (!seeAllIsActive) {
        scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    }
  }

  void navigateToDetailPage(BuildContext context, EventModel eventModel) {
    focusNode.unfocus();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return DetailView(eventModel: eventModel);
      },
    ));
  }

  void searchEventInList(String value) {
    filteredEventList = eventList.where((event) => event.name.toString().toLowerCase().contains(value.toLowerCase())).toList();
    if (value.isNotEmpty) {
      isSearched = true;
      seeAllIsActive = true;
    } else if (value.isEmpty) {
      isSearched = false;
      if (categoryList != null && categoryList!.length > 0) {
        selectCategory(0);
      }
    }
  }

  void removeSearch() {}
}
