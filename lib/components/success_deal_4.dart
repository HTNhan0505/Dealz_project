import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/d3_q3.dart';
import 'package:dealz_app/views/d4_q4.dart';
import 'package:flutter/material.dart';

class SuccessDeal4 extends StatefulWidget {
  const SuccessDeal4({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<SuccessDeal4> createState() => _SuccessDeal4State();
}

class _SuccessDeal4State extends State<SuccessDeal4> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => D4Q4Screen(),
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
