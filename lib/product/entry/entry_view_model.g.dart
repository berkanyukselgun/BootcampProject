// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EntryViewModel on _EntryViewModelBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: '_EntryViewModelBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$leftWidgetAtom =
      Atom(name: '_EntryViewModelBase.leftWidget', context: context);

  @override
  AppBarWidgets? get leftWidget {
    _$leftWidgetAtom.reportRead();
    return super.leftWidget;
  }

  @override
  set leftWidget(AppBarWidgets? value) {
    _$leftWidgetAtom.reportWrite(value, super.leftWidget, () {
      super.leftWidget = value;
    });
  }

  late final _$rightWidgetAtom =
      Atom(name: '_EntryViewModelBase.rightWidget', context: context);

  @override
  AppBarWidgets? get rightWidget {
    _$rightWidgetAtom.reportRead();
    return super.rightWidget;
  }

  @override
  set rightWidget(AppBarWidgets? value) {
    _$rightWidgetAtom.reportWrite(value, super.rightWidget, () {
      super.rightWidget = value;
    });
  }

  late final _$_EntryViewModelBaseActionController =
      ActionController(name: '_EntryViewModelBase', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$_EntryViewModelBaseActionController.startAction(
        name: '_EntryViewModelBase.init');
    try {
      return super.init();
    } finally {
      _$_EntryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBarIcons() {
    final _$actionInfo = _$_EntryViewModelBaseActionController.startAction(
        name: '_EntryViewModelBase.changeBarIcons');
    try {
      return super.changeBarIcons();
    } finally {
      _$_EntryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$_EntryViewModelBaseActionController.startAction(
        name: '_EntryViewModelBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_EntryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
leftWidget: ${leftWidget},
rightWidget: ${rightWidget}
    ''';
  }
}
