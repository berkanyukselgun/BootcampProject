// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on _AuthViewModelBase, Store {
  late final _$authTypeAtom =
      Atom(name: '_AuthViewModelBase.authType', context: context);

  @override
  AuthType get authType {
    _$authTypeAtom.reportRead();
    return super.authType;
  }

  @override
  set authType(AuthType value) {
    _$authTypeAtom.reportWrite(value, super.authType, () {
      super.authType = value;
    });
  }

  late final _$_AuthViewModelBaseActionController =
      ActionController(name: '_AuthViewModelBase', context: context);

  @override
  dynamic changeAuthType() {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
        name: '_AuthViewModelBase.changeAuthType');
    try {
      return super.changeAuthType();
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authType: ${authType}
    ''';
  }
}
