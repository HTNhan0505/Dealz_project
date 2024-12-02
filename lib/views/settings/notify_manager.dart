import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import '../../components/notification_global.dart';

class NotificationManager extends StatefulWidget {
  @override
  _NotificationManagerState createState() => _NotificationManagerState();
}

class _NotificationManagerState extends State<NotificationManager> {
  final NotificationService _notificationService = NotificationService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  DateTime? _scheduledTime;
  List<PendingNotificationRequest> _notifications = [];

  @override
  void initState() {
    super.initState();
    _notificationService.init();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final notifications = await _notificationService.getPendingNotifications();
    setState(() {
      _notifications = notifications;
    });
  }

  void _scheduleNotification() async {
    if (_scheduledTime == null ||
        _titleController.text.isEmpty ||
        _bodyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all fields and set a time')));
      return;
    }

    try {
      await _notificationService.scheduleNotification(
        title: _titleController.text,
        body: _bodyController.text,
        scheduledTime: _scheduledTime!,
      );
      _titleController.clear();
      _bodyController.clear();
      _scheduledTime = null;
      await _loadNotifications();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Notification scheduled successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  void _deleteNotification(int id) async {
    await _notificationService.cancelNotification(id);
    await _loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Manager')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(_scheduledTime == null
                      ? 'No time selected'
                      : DateFormat('yyyy-MM-dd HH:mm')
                      .format(_scheduledTime!)),
                ),
                TextButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        setState(() {
                          _scheduledTime = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        });
                      }
                    }
                  },
                  child: Text('Select Time'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _scheduleNotification,
              child: Text('Schedule Notification'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  final notification = _notifications[index];
                  return ListTile(
                    title: Text(notification.title ?? 'No Title'),
                    subtitle: Text(notification.body ?? 'No Body'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          _deleteNotification(notification.id.hashCode),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
