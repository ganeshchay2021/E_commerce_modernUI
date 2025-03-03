import 'package:e_commerce_modernui/model/notification_item.dart';
import 'package:e_commerce_modernui/repository/notification_repository.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/utils/notification_utils.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          leading: CustomIconbutton(
            icon: Icons.arrow_back_ios,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Notification",
            style: AppTextstyles.withColor(
              AppTextstyles.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //Mark all read read
              },
              child: Text(
                "Mark all as read",
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyMedium,
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: NotificationRepository.getNotification().length,
          itemBuilder: (context, index) {
            final notification =
                NotificationRepository.getNotification()[index];
            return _buildNotificationCard(context, notification);
          },
        ));
  }

  Widget _buildNotificationCard(
      BuildContext context, NotificationItem notification) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: notification.isRead
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1)),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: NotificationUtils.getIconBackgroundColor(
                  context, notification.type)),
          child: Icon(
            NotificationUtils.getNotificationIcon(context, notification.type),
            color: NotificationUtils.getIconColor(context, notification.type),
          ),
        ),
        title: Text(
          notification.title,
          style: AppTextstyles.withColor(
            AppTextstyles.bodyLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
      ),
    );
  }
}
