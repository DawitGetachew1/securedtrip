import 'package:awesome_notifications/awesome_notifications.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

Future<void> createNotification(String status) async {
  await AwesomeNotifications().createNotification(
    content:
        NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'Status Update',
            body: 'You Assigned To  $status',
            notificationLayout: NotificationLayout.Default,
        ),
  );
}
