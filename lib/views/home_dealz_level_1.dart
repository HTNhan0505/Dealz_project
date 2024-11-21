import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../components/global_pop_up.dart';

class HomeDealzLevel1Screen extends StatefulWidget {
  const HomeDealzLevel1Screen({super.key});

  @override
  State<HomeDealzLevel1Screen> createState() => _HomeDealzLevel1ScreenState();
}

class _HomeDealzLevel1ScreenState extends State<HomeDealzLevel1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            const Text(
              'LEVEL 1',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 50.0,
                runSpacing: 20.0,
                children: List.generate(5, (index) {
                  return InkWell(
                    onTap: () {
                      GlobalPopup().show(
                          context,
                          'Deal 1',
                          '01 áo sơ mi -  Xác nhận chọn DealZ ?',
                          RouteNames.successScreen);
                    },
                    child: ClipOval(
                      child: Image.asset(
                        'lib/resources/splash_screen.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'LEVEL 2',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20.0,
                runSpacing: 20.0,
                children: List.generate(10, (index) {
                  return Container(
                    width: 50,
                    height: 25,
                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                  );
                }),
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'LEVEL 3',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            const SizedBox(height: 40),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'lib/resources/splash_screen.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
