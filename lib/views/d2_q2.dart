import 'package:dealz_app/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';

class D2Q2Screen extends StatefulWidget {
  const D2Q2Screen({super.key});

  @override
  State<D2Q2Screen> createState() => _D2Q2ScreenState();
}

class _D2Q2ScreenState extends State<D2Q2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.homeDealzLevel1);
          },
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: Text('QUEST 2'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Buớc 1, đến văn phòng của SM Groups và chờ thông tin tiếp theo.',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
