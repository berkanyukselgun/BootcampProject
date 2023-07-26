// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailViewModel on _DetailViewModelBase, Store {
  late final _$favListAtom =
      Atom(name: '_DetailViewModelBase.favList', context: context);

  @override
  List<EventModel> get favList {
    _$favListAtom.reportRead();
    return super.favList;
  }

  @override
  set favList(List<EventModel> value) {
    _$favListAtom.reportWrite(value, super.favList, () {
      super.favList = value;
    });
  }

  late final _$isFavAtom =
      Atom(name: '_DetailViewModelBase.isFav', context: context);

  @override
  bool get isFav {
    _$isFavAtom.reportRead();
    return super.isFav;
  }

  @override
  set isFav(bool value) {
    _$isFavAtom.reportWrite(value, super.isFav, () {
      super.isFav = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_DetailViewModelBase.items', context: context);

  @override
  List<EventExpandedItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<EventExpandedItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$favButtonAsyncAction =
      AsyncAction('_DetailViewModelBase.favButton', context: context);

  @override
  Future<void> favButton(EventModel event) {
    return _$favButtonAsyncAction.run(() => super.favButton(event));
  }

  late final _$_DetailViewModelBaseActionController =
      ActionController(name: '_DetailViewModelBase', context: context);

  @override
  dynamic changeExpansion(int index, bool isExpanded) {
    final _$actionInfo = _$_DetailViewModelBaseActionController.startAction(
        name: '_DetailViewModelBase.changeExpansion');
    try {
      return super.changeExpansion(index, isExpanded);
    } finally {
      _$_DetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic init(EventModel eventModel) {
    final _$actionInfo = _$_DetailViewModelBaseActionController.startAction(
        name: '_DetailViewModelBase.init');
    try {
      return super.init(eventModel);
    } finally {
      _$_DetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favList: ${favList},
isFav: ${isFav},
items: ${items}
    ''';
  }
}
