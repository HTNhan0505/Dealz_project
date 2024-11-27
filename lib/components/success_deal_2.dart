import 'package:dealz_app/components/count_down_page.dart';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/d2_q2.dart';
import 'package:dealz_app/views/home_dealz_level_1.dart';
import 'package:flutter/material.dart';

import '../utils/routes/routes_names.dart';

class SuccessDeal2 extends StatefulWidget {
  const SuccessDeal2({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<SuccessDeal2> createState() => _SuccessDeal2State();
}

class _SuccessDeal2State extends State<SuccessDeal2> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => D2Q2Screen(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
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
