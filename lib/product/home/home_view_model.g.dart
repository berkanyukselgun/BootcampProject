// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$eventListAtom =
      Atom(name: '_HomeViewModelBase.eventList', context: context);

  @override
  List<EventModel> get eventList {
    _$eventListAtom.reportRead();
    return super.eventList;
  }

  @override
  set eventList(List<EventModel> value) {
    _$eventListAtom.reportWrite(value, super.eventList, () {
      super.eventList = value;
    });
  }

  late final _$seeAllIsActiveAtom =
      Atom(name: '_HomeViewModelBase.seeAllIsActive', context: context);

  @override
  bool get seeAllIsActive {
    _$seeAllIsActiveAtom.reportRead();
    return super.seeAllIsActive;
  }

  @override
  set seeAllIsActive(bool value) {
    _$seeAllIsActiveAtom.reportWrite(value, super.seeAllIsActive, () {
      super.seeAllIsActive = value;
    });
  }

  late final _$categoryListAtom =
      Atom(name: '_HomeViewModelBase.categoryList', context: context);

  @override
  List<Format>? get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<Format>? value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  late final _$filteredEventListAtom =
      Atom(name: '_HomeViewModelBase.filteredEventList', context: context);

  @override
  List<EventModel>? get filteredEventList {
    _$filteredEventListAtom.reportRead();
    return super.filteredEventList;
  }

  @override
  set filteredEventList(List<EventModel>? value) {
    _$filteredEventListAtom.reportWrite(value, super.filteredEventList, () {
      super.filteredEventList = value;
    });
  }

  late final _$isSearchedAtom =
      Atom(name: '_HomeViewModelBase.isSearched', context: context);

  @override
  bool get isSearched {
    _$isSearchedAtom.reportRead();
    return super.isSearched;
  }

  @override
  set isSearched(bool value) {
    _$isSearchedAtom.reportWrite(value, super.isSearched, () {
      super.isSearched = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_HomeViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$getEventsToLocalFromApiAsyncAction = AsyncAction(
      '_HomeViewModelBase.getEventsToLocalFromApi',
      context: context);

  @override
  Future<void> getEventsToLocalFromApi() {
    return _$getEventsToLocalFromApiAsyncAction
        .run(() => super.getEventsToLocalFromApi());
  }

  late final _$initAsyncAction =
      AsyncAction('_HomeViewModelBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getEventListAsyncAction =
      AsyncAction('_HomeViewModelBase.getEventList', context: context);

  @override
  Future<void> getEventList() {
    return _$getEventListAsyncAction.run(() => super.getEventList());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  dynamic seeAll() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.seeAll');
    try {
      return super.seeAll();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterEventsByCategory(Format selectedCategory) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.filterEventsByCategory');
    try {
      return super.filterEventsByCategory(selectedCategory);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isSelected(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.isSelected');
    try {
      return super.isSelected(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCategory(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.selectCategory');
    try {
      return super.selectCategory(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tapped(int index) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.tapped');
    try {
      return super.tapped(index);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
eventList: ${eventList},
seeAllIsActive: ${seeAllIsActive},
categoryList: ${categoryList},
filteredEventList: ${filteredEventList},
isSearched: ${isSearched},
selectedIndex: ${selectedIndex}
    ''';
  }
}
