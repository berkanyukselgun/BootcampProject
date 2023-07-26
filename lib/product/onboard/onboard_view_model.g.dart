// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardViewModel on _OnboardViewModelBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: '_OnboardViewModelBase.currentPageIndex', context: context);

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

  late final _$pageNameAtom =
      Atom(name: '_OnboardViewModelBase.pageName', context: context);

  @override
  String get pageName {
    _$pageNameAtom.reportRead();
    return super.pageName;
  }

  @override
  set pageName(String value) {
    _$pageNameAtom.reportWrite(value, super.pageName, () {
      super.pageName = value;
    });
  }

  late final _$leftWidgetAtom =
      Atom(name: '_OnboardViewModelBase.leftWidget', context: context);

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

  late final _$_OnboardViewModelBaseActionController =
      ActionController(name: '_OnboardViewModelBase', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.init');
    try {
      return super.init();
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBarInfos() {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.changeBarInfos');
    try {
      return super.changeBarInfos();
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
pageName: ${pageName},
leftWidget: ${leftWidget}
    ''';
  }
}
