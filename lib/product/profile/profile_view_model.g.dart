// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  late final _$currentUserAtom =
      Atom(name: '_ProfileViewModelBase.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$ppicFutureAtom =
      Atom(name: '_ProfileViewModelBase.ppicFuture', context: context);

  @override
  Future<Uint8List?>? get ppicFuture {
    _$ppicFutureAtom.reportRead();
    return super.ppicFuture;
  }

  @override
  set ppicFuture(Future<Uint8List?>? value) {
    _$ppicFutureAtom.reportWrite(value, super.ppicFuture, () {
      super.ppicFuture = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileViewModelBase.isLoading', context: context);

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

  late final _$noEventAtom =
      Atom(name: '_ProfileViewModelBase.noEvent', context: context);

  @override
  bool get noEvent {
    _$noEventAtom.reportRead();
    return super.noEvent;
  }

  @override
  set noEvent(bool value) {
    _$noEventAtom.reportWrite(value, super.noEvent, () {
      super.noEvent = value;
    });
  }

  late final _$categoryCountMapAtom =
      Atom(name: '_ProfileViewModelBase.categoryCountMap', context: context);

  @override
  Map<String, int> get categoryCountMap {
    _$categoryCountMapAtom.reportRead();
    return super.categoryCountMap;
  }

  @override
  set categoryCountMap(Map<String, int> value) {
    _$categoryCountMapAtom.reportWrite(value, super.categoryCountMap, () {
      super.categoryCountMap = value;
    });
  }

  late final _$removeFavAsyncAction =
      AsyncAction('_ProfileViewModelBase.removeFav', context: context);

  @override
  Future removeFav(EventModel eventModel) {
    return _$removeFavAsyncAction.run(() => super.removeFav(eventModel));
  }

  late final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase', context: context);

  @override
  bool containsUser(GroupModel groupModel) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.containsUser');
    try {
      return super.containsUser(groupModel);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic leaveGroup(BuildContext context, EventModel? eventModel) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.leaveGroup');
    try {
      return super.leaveGroup(context, eventModel);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic joinGroup(BuildContext context, EventModel? eventModel) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.joinGroup');
    try {
      return super.joinGroup(context, eventModel);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic countFavEventCategories(List<GroupModel> favEventsGroups) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.countFavEventCategories');
    try {
      return super.countFavEventCategories(favEventsGroups);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
ppicFuture: ${ppicFuture},
isLoading: ${isLoading},
noEvent: ${noEvent},
categoryCountMap: ${categoryCountMap}
    ''';
  }
}
