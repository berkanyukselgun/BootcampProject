// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapbox_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapBoxViewModel on _MapBoxViewModelBase, Store {
  late final _$eventListAtom =
      Atom(name: '_MapBoxViewModelBase.eventList', context: context);

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

  late final _$groupListAtom =
      Atom(name: '_MapBoxViewModelBase.groupList', context: context);

  @override
  List<GroupModel> get groupList {
    _$groupListAtom.reportRead();
    return super.groupList;
  }

  @override
  set groupList(List<GroupModel> value) {
    _$groupListAtom.reportWrite(value, super.groupList, () {
      super.groupList = value;
    });
  }

  late final _$markerListAtom =
      Atom(name: '_MapBoxViewModelBase.markerList', context: context);

  @override
  List<Marker> get markerList {
    _$markerListAtom.reportRead();
    return super.markerList;
  }

  @override
  set markerList(List<Marker> value) {
    _$markerListAtom.reportWrite(value, super.markerList, () {
      super.markerList = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: '_MapBoxViewModelBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_MapBoxViewModelBase.selectedIndex', context: context);

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

  late final _$onTapAsyncAction =
      AsyncAction('_MapBoxViewModelBase.onTap', context: context);

  @override
  Future<void> onTap(int index) {
    return _$onTapAsyncAction.run(() => super.onTap(index));
  }

  late final _$getEventListAsyncAction =
      AsyncAction('_MapBoxViewModelBase.getEventList', context: context);

  @override
  Future<void> getEventList() {
    return _$getEventListAsyncAction.run(() => super.getEventList());
  }

  late final _$initAsyncAction =
      AsyncAction('_MapBoxViewModelBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getLocationAsyncAction =
      AsyncAction('_MapBoxViewModelBase.getLocation', context: context);

  @override
  Future<void> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  late final _$_MapBoxViewModelBaseActionController =
      ActionController(name: '_MapBoxViewModelBase', context: context);

  @override
  void initPageController() {
    final _$actionInfo = _$_MapBoxViewModelBaseActionController.startAction(
        name: '_MapBoxViewModelBase.initPageController');
    try {
      return super.initPageController();
    } finally {
      _$_MapBoxViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Marker> buildMarkers() {
    final _$actionInfo = _$_MapBoxViewModelBaseActionController.startAction(
        name: '_MapBoxViewModelBase.buildMarkers');
    try {
      return super.buildMarkers();
    } finally {
      _$_MapBoxViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventList: ${eventList},
groupList: ${groupList},
markerList: ${markerList},
pageController: ${pageController},
selectedIndex: ${selectedIndex}
    ''';
  }
}
