import 'package:dealz_app/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';

class D2Q2Screen extends StatefulWidget {
  const D2Q2Screen({super.key});

  @override
  State<D2Q2Screen> createState() => _D2Q2ScreenState();
}

class _D2Q2ScreenState extends State<D2Q2Screen> {
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
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Deal 2',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Quest 2 sẽ được giao trong thời gian sớm nhất.',
                        style: TextStyle(
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
