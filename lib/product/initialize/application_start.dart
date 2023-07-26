import 'package:akademi_bootcamp/core/memory/hive_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart' as intl_local_date_data;
import '../../core/memory/shared_preferences_manager.dart';
import '../../core/services/firebase/firebase_options.dart';
import '../../core/services/notification/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await intl_local_date_data.initializeDateFormatting();
    await NotificationService.instance.initNotification();
    tz.initializeTimeZones();
    await SharedPrefsManager.instance.initialize();
    await Hive.initFlutter();
    await HiveManager.instance.initialize();
  }
}
