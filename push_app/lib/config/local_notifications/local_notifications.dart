import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> requestPermissionLocalNotiofications() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
}
