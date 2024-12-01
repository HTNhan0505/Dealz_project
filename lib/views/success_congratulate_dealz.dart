import 'package:dealz_app/components/count_down_page.dart';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/routes/routes_names.dart';

class SuccessCongratulateDealz extends StatefulWidget {
  SuccessCongratulateDealz({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<SuccessCongratulateDealz> createState() =>
      _SuccessCongratulateDealzState();
}

class _SuccessCongratulateDealzState extends State<SuccessCongratulateDealz> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 4500), () {
      Navigator.pushNamed(context, RouteNames.homeDealzLevel1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              textAlign: TextAlign.center,
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
