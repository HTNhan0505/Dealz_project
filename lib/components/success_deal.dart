import 'package:dealz_app/components/count_down_page.dart';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/routes/routes_names.dart';

class SuccessDeal extends StatefulWidget {
  SuccessDeal({super.key, required this.titleSuccess});

  final String titleSuccess;

  @override
  State<SuccessDeal> createState() => _SuccessDealState();
}

class _SuccessDealState extends State<SuccessDeal> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => CountDownPage(
              autoCountDown: true,
              nameQuest: '',
              showNextBtn: false,
              titleQuest: 'DEAL 1',
              nameBtn: '',
            ),
            transitionDuration: Duration(seconds: 2),
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
