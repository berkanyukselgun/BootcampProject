import 'dart:io';
import 'package:akademi_bootcamp/core/constants/navigation/navigation_constants.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_service.dart';
import 'package:akademi_bootcamp/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../../core/services/firestore/firestore_manager.dart';
import '../../core/services/storage/storage_service.dart';
part 'profile_edit_view_model.g.dart';

class ProfileEditViewModel = _ProfileEditViewModelBase with _$ProfileEditViewModel;

abstract class _ProfileEditViewModelBase with Store {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @observable
  File? pickedImage;

  @action
  init() {
    fullnameController.text = AuthService.instance.currentUser?.fullname ?? '';
    cityController.text = AuthService.instance.currentUser?.city ?? '';
    genderController.text = AuthService.instance.currentUser?.gender ?? '';
  }

  saveChanges(BuildContext context) async {
    String? uid = AuthService.instance.currentUser?.userID;
    if (uid == null) return;
    if (fullnameController.text.isNotEmpty) {
      String? mediaUrl = AuthService.instance.currentUser?.photoUrl;
      cityController.text =
          cityController.text.isNotEmpty && cityController.text.length > 1 ? "${cityController.text[0].toUpperCase()}${cityController.text.substring(1).toLowerCase()}" : cityController.text;
      await FirestoreManager.instance.firestoreUpdateFields(collectionID: 'users', docID: uid, fields: {
        'fullname': fullnameController.text,
        'photo_url': imageRemoved ? null : AuthService.instance.currentUser?.photoUrl,
        'gender': genderController.text.isEmpty ? null : genderController.text,
        'city': cityController.text.isEmpty ? null : cityController.text
      });
      await AuthService.instance.syncChangesAfterEdit();
      if (pickedImage != null) {
        await StorageService.instance.uploadMedia(pickedImage!);
      }
      if (imageRemoved && mediaUrl != null) {
        await StorageService.instance.deleteMedia(mediaUrl);
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: AppColors.green, content: Text("Profil güncellendi")));
      NavigationService.instance.navigateToPage(path: NavigationConstants.APP_BASE);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: AppColors.red, content: Text("Ad alanı boş bırakılamaz")));
    }
  }

  @action
  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      File tempImage = File(photo.path);
      pickedImage = tempImage;
      imageRemoved = false;
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @observable
  bool imageRemoved = false;

  @action
  removeImage(BuildContext context) async {
    pickedImage = null;
    imageRemoved = true;
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
