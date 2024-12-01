import 'dart:math';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/utils/time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/time_provider.dart';

import '../views/success_congratulate_dealz.dart';
import 'notification_global.dart';

class CountDownSuccessQ2 extends StatefulWidget {
  final bool autoCountDown;
  final bool showNextBtn;
  final String nameQuest;
  final String titleQuest;
  final VoidCallback? funcBtn;

  CountDownSuccessQ2(
      {super.key,
      required this.autoCountDown,
      required this.nameQuest,
      required this.showNextBtn,
      required this.titleQuest,
      this.funcBtn});

  @override
  State<CountDownSuccessQ2> createState() => _CountDownSuccessQ2State();
}

class _CountDownSuccessQ2State extends State<CountDownSuccessQ2> {
  bool isShowBtn = false;
  bool isLoading = true;
  String? _statusMessage;

  void _scheduleNotification() async {
    try {
      final DateTime now = DateTime.now();

      final DateTime scheduledTime = now.add(const Duration(minutes: 1));

      await NotificationService().scheduleNotification(
        title: 'Dealz thông báo',
        body:
            'Thông báo này xuất hiện ${scheduledTime.hour} : ${scheduledTime.minute}!',
        scheduledTime: scheduledTime,
      );

      setState(() {
        _statusMessage =
            'Đã lên lịch thông báo vào lúc ${scheduledTime.hour}:${scheduledTime.minute}!';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Không thể lên lịch thông báo: ${e.toString()}';
      });
    }
  }

  void _showTimePicker(BuildContext context, TimeProvider timerProvider) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          height: 300,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms,
            initialTimerDuration:
                Duration(seconds: timerProvider.remainingTime),
            onTimerDurationChanged: (Duration newDuration) {
              if (newDuration.inSeconds > 0) {
                timerProvider.setTime(newDuration.inSeconds);
              }
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final timeProvider = Provider.of<TimeProvider>(context, listen: false);

      timeProvider.onTimerFinish = () {
        timeProvider.startTimer();
      };

      if (widget.autoCountDown) {
        timeProvider.startTimer();
        timeProvider.setTime(120);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimeProvider>(context);

    double progress = timeProvider.initialTime > 0
        ? timeProvider.remainingTime / timeProvider.initialTime
        : 0;

    return isLoading
        ? GestureDetector(
            onTap: () {
              setState(() {
                isLoading = false;
              });
            },
            child: Material(
              color: AppColors.blackColor.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'LỖI',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Deal không thể hoàn thành.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              backgroundColor: AppColors.whiteColor,
              title: GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowBtn = !isShowBtn;
                    });
                  },
                  child: Text(widget.titleQuest)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.nameQuest,
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(220, 220),
                        painter: DashedCirclePainter(),
                      ),
                      SizedBox(
                        width: 220,
                        height: 220,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          color: Colors.black,
                          strokeWidth: 5,
                          value: progress,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showTimePicker(context, timeProvider),
                        child: Text(
                          TimeUtil.instance
                              .formatTime(timeProvider.remainingTime),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 45),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  if (_statusMessage != null) // Hiển thị thông báo trạng thái
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        _statusMessage!,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  widget.showNextBtn
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 45),
                                decoration: BoxDecoration(
                                  color: Colors.black, // Màu nền của nút
                                  borderRadius:
                                      BorderRadius.circular(16), // Bo góc
                                ),
                                child: const Center(
                                  child: Text(
                                    'X2 Deal',
                                    style: TextStyle(
                                      color: Colors.white, // Màu chữ
                                      fontSize: 16, // Kích thước chữ
                                      fontWeight: FontWeight.bold, // In đậm chữ
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(), 
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SuccessCongratulateDealz(
                                      titleSuccess:
                                          'Chúc mừng bạn đã hoàn thành Quest 2. Hãy chọn deal tiếp theo của bạn',
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 45),
                                decoration: BoxDecoration(
                                  color: Colors.black, // Màu nền của nút
                                  borderRadius:
                                      BorderRadius.circular(16), // Bo góc
                                ),
                                child: const Center(
                                  child: Text(
                                    'Hủy Deal',
                                    style: TextStyle(
                                      color: Colors.white, // Màu chữ
                                      fontSize: 16, // Kích thước chữ
                                      fontWeight: FontWeight.bold, // In đậm chữ
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  isShowBtn
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: timeProvider.isRunning
                                  ? timeProvider.pauseTimer
                                  : timeProvider.startTimer,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.blackColor,
                                ),
                                child: Icon(
                                  timeProvider.isRunning
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 40,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: _scheduleNotification,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.blackColor,
                                ),
                                child: const Icon(
                                  Icons.stop,
                                  size: 35,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const Row()
                ],
              ),
            ),
          );
  }
}

class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.blackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    double dashWidth = 4;
    double dashSpace = 4;
    double radius = (size.width / 2) - paint.strokeWidth / 2;
    double circumference = 2 * pi * radius;

    int dashCount = (circumference / (dashWidth + dashSpace)).floor();
    double angle = (2 * pi) / dashCount;

    for (int i = 0; i < dashCount; i++) {
      double startAngle = i * angle;
      Offset startPoint = Offset(
        size.width / 2 + radius * cos(startAngle),
        size.height / 2 + radius * sin(startAngle),
      );
      Offset endPoint = Offset(
        size.width / 2 +
            radius *
                cos(startAngle + angle * (dashWidth / (dashWidth + dashSpace))),
        size.height / 2 +
            radius *
                sin(startAngle + angle * (dashWidth / (dashWidth + dashSpace))),
      );
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
