import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/d3_q3.dart';
import 'package:dealz_app/views/d4_q4.dart';
import 'package:flutter/material.dart';

class CancelDeal extends StatefulWidget {
  const CancelDeal({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<CancelDeal> createState() => _CancelDealState();
}

class _CancelDealState extends State<CancelDeal> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
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
