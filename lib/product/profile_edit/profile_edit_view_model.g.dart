// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileEditViewModel on _ProfileEditViewModelBase, Store {
  late final _$pickedImageAtom =
      Atom(name: '_ProfileEditViewModelBase.pickedImage', context: context);

  @override
  File? get pickedImage {
    _$pickedImageAtom.reportRead();
    return super.pickedImage;
  }

  @override
  set pickedImage(File? value) {
    _$pickedImageAtom.reportWrite(value, super.pickedImage, () {
      super.pickedImage = value;
    });
  }

  late final _$imageRemovedAtom =
      Atom(name: '_ProfileEditViewModelBase.imageRemoved', context: context);

  @override
  bool get imageRemoved {
    _$imageRemovedAtom.reportRead();
    return super.imageRemoved;
  }

  @override
  set imageRemoved(bool value) {
    _$imageRemovedAtom.reportWrite(value, super.imageRemoved, () {
      super.imageRemoved = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_ProfileEditViewModelBase.pickImage', context: context);

  @override
  Future pickImage(ImageSource imageType) {
    return _$pickImageAsyncAction.run(() => super.pickImage(imageType));
  }

  late final _$removeImageAsyncAction =
      AsyncAction('_ProfileEditViewModelBase.removeImage', context: context);

  @override
  Future removeImage(BuildContext context) {
    return _$removeImageAsyncAction.run(() => super.removeImage(context));
  }

  late final _$_ProfileEditViewModelBaseActionController =
      ActionController(name: '_ProfileEditViewModelBase', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$_ProfileEditViewModelBaseActionController
        .startAction(name: '_ProfileEditViewModelBase.init');
    try {
      return super.init();
    } finally {
      _$_ProfileEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickedImage: ${pickedImage},
imageRemoved: ${imageRemoved}
    ''';
  }
}
