import 'package:akademi_bootcamp/core/constants/memory/shared_prefs_keys.dart';
import 'package:akademi_bootcamp/core/memory/shared_preferences_manager.dart';
import 'package:akademi_bootcamp/core/model/user_model.dart';
import 'package:akademi_bootcamp/core/services/api/etkinlikIO_service.dart';
import 'package:akademi_bootcamp/core/services/notification/notification_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../core/constants/navigation/navigation_constants.dart';
import '../../core/init/navigation/navigation_service.dart';
import '../../core/memory/hive_manager.dart';
import '../../core/model/event_model.dart';
import '../../core/services/auth/auth_service.dart';

class SplashViewmodel {
  initialize() async {
    await checkConnectivityAndUpdateStorage();
    NotificationService.instance.getNotificationPermission();

    pageGenerator();
  }

  Future<void> checkConnectivityAndUpdateStorage() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
    } else {
      await getEventsToLocalFromApi();
    }
  }

  Future<void> getEventsToLocalFromApi() async {
    try {
      List<EventModel>? eventList = await EtkinlikIOService.instance.fetchEventList();

      if (eventList != null) {
        if (HiveManager.instance.eventsBox != null) {
          await HiveManager.instance.eventsBox!.clear();
          await HiveManager.instance.eventsBox!.addAll(eventList);
          await HiveManager.instance.categoriesBox!.clear();
          await HiveManager.instance.categoriesBox!.addAll(EtkinlikIOService.instance.categoryList);
        }
      }
    } catch (e) {
      print('error $e');
    }
  }

  pageGenerator() {
    bool openedBefore = SharedPrefsManager.instance.getBoolValue(SharedPrefsKeys.OPENED_BEFORE);
    if (!openedBefore) {
      SharedPrefsManager.instance.setBoolValue(SharedPrefsKeys.OPENED_BEFORE, true);
      return NavigationService.instance.navigateToPageRemoved(path: NavigationConstants.WELCOME);
    } else {
      var uid = SharedPrefsManager.instance.getStringValue(SharedPrefsKeys.UID);
      if (uid != '') {
        AuthService.instance.uid = uid;
        dynamic userData = SharedPrefsManager.instance.getMapValue(SharedPrefsKeys.USER_DATA);
        AuthService.instance.currentUser = UserModel.fromJson(userData);
        AuthService.instance.userData = userData;
      }
      NavigationService.instance.navigateToPageRemoved(path: NavigationConstants.APP_BASE);
    }
  }
}
