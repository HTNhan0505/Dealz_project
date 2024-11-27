import 'package:dealz_app/components/count_down_page.dart';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/success_congratulate_dealz.dart';
import 'package:flutter/material.dart';

import '../utils/routes/routes_names.dart';

class SuccessAfterPhotoQ2 extends StatefulWidget {
  SuccessAfterPhotoQ2({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<SuccessAfterPhotoQ2> createState() => _SuccessAfterPhotoQ2State();
}

class _SuccessAfterPhotoQ2State extends State<SuccessAfterPhotoQ2> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'LỖI',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  'Deal không thể hoàn thành.',
                  style: const TextStyle(
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

