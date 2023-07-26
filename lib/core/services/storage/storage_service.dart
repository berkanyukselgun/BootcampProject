import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import '../../constants/memory/shared_prefs_keys.dart';
import '../../memory/shared_preferences_manager.dart';
import '../auth/auth_service.dart';
import '../firestore/firestore_manager.dart';
import 'package:http/http.dart' as http;

class StorageService {
  StorageService._();
  static late final StorageService instance = StorageService._();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> uploadMedia(File file) async {
    final String? uid = AuthService.instance.uid;
    if (uid != null && AuthService.instance.currentUser != null) {
      final storageRef = _firebaseStorage.ref();
      final imgRef = storageRef.child("ppics/$uid.jpg");
      await imgRef.putFile(file);
      await FirestoreManager.instance.firestoreUpdateOneField(collectionID: 'users', docID: uid, key: 'photo_url', value: imgRef.fullPath);
      AuthService.instance.currentUser!.photoUrl = imgRef.fullPath;
      AuthService.instance.userData = AuthService.instance.currentUser!.toJson();
      SharedPrefsManager.instance.setMapValue(SharedPrefsKeys.USER_DATA, AuthService.instance.userData);
    } else {
      print('Dosya yükleme hatası.');
    }
    return null;
  }

  Future<void> uploadGooglePhotoToStorage(String photoUrl) async {
    final storageRef = _firebaseStorage.ref('ppics');
    final uid = AuthService.instance.uid;
    final fileName = '$uid.jpg';
    Reference reference = await storageRef.child(fileName);
    reference.putData(await http.get(Uri.parse(photoUrl)).then((res) => res.bodyBytes));
    AuthService.instance.currentUser!.photoUrl = reference.fullPath;
    AuthService.instance.userData = AuthService.instance.currentUser!.toJson();
    SharedPrefsManager.instance.setMapValue(SharedPrefsKeys.USER_DATA, AuthService.instance.userData);
  }

  Future<Uint8List?> downloadPPic(String? photoUrl) async {
    if (photoUrl == null) return null;
    Uint8List? uint8list = await _firebaseStorage.ref(photoUrl).getData();
    return uint8list;
  }

  Future<void> deleteMedia(String mediaPath) async {
    final reference = FirebaseStorage.instance.ref().child(mediaPath);
    await reference.delete();
  }
}
