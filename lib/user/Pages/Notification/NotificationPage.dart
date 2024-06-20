import 'package:car_admin/user/Controller/NotificationController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationControler notificationControler =
        Get.put(NotificationControler());
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
        ),
        body: Obx(
          () => notificationControler.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: notificationControler.notificationList
                      .map(
                        (e) => ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              notificationControler.deleteNotification(e.id!);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          leading: Icon(Icons.notifications),
                          title: Text(
                            '${e.title}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            '${e.description}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      )
                      .toList()),
        ));
  }
}
