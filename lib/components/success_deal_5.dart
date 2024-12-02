import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/d3_q3.dart';
import 'package:dealz_app/views/d4_q4.dart';
import 'package:dealz_app/views/d5_q5.dart';
import 'package:flutter/material.dart';

class SuccessDeal5 extends StatefulWidget {
  const SuccessDeal5({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<SuccessDeal5> createState() => _SuccessDeal5State();
}

class _SuccessDeal5State extends State<SuccessDeal5> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => D5Q5(
                autoCountDown: true,
                nameQuest:
                    'Bước 1, vào lúc 12:00PM hôm nay, bạn có 15 phút để đi đến hầm giữ xe của toà nhà SM Groups, tìm chiếc ô tô có biển số 300.59 tại ô đậu xe A15 và chờ hướng dẫn tiếp theo.',
                showNextBtn: true,
                titleQuest: 'QUEST 5',
                nameBtn: 'NEXT'),
          ));
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.blackColor,
            ),
          )
        : Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.blackColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: AppColors.whiteColor,
                        size: 50,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.titleSuccess.isNotEmpty
                        ? widget.titleSuccess
                        : 'CHỐT DEALZ',
                    style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          );
  }
}
