import 'package:dealz_app/components/count_down_page.dart';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/success_congratulate_dealz.dart';
import 'package:flutter/material.dart';

import '../utils/routes/routes_names.dart';

class SuccessAfterPhoto extends StatefulWidget {
  SuccessAfterPhoto({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<SuccessAfterPhoto> createState() => _SuccessAfterPhotoState();
}

class _SuccessAfterPhotoState extends State<SuccessAfterPhoto> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuccessCongratulateDealz(
                  titleSuccess:
                      'Chúc mừng bạn đã hoàn thành Quest 1. Level 2 đã được mở khóa')));
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
                    widget.titleSuccess,
                    style: TextStyle(
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
