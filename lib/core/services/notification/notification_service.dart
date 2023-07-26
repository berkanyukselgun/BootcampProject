import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._();
  static late final NotificationService instance = NotificationService._();
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('ic_launcher');
    var initializationSettingsIOS =
        DarwinInitializationSettings(requestAlertPermission: true, requestBadgePermission: true, requestSoundPermission: true, onDidReceiveLocalNotification: (id, title, body, payload) async {});
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (details) async {});
  }

  getNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
    } else {}
  }

  notificationDetails() {
    return const NotificationDetails(android: AndroidNotificationDetails('channelId', 'channelName', importance: Importance.max), iOS: DarwinNotificationDetails());
  }

  Future showNotification({int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(id, title, body, await notificationDetails());
  }

  scheduleNotification({int id = 0, String? title, String? body, String? payLoad, required DateTime scheduledNotificationDateTime}) async {
    return notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
      await notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
