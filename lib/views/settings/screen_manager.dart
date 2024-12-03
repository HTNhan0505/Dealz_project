import 'package:dealz_app/views/home_dealz_level_1.dart';
import 'package:flutter/material.dart';

import '../../resources/colors/app_colors.dart';
import '../d4_q4.dart';

class ScreenManager extends StatelessWidget {
  const ScreenManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: const Text("Chọn màn hình để quay",
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 50.0,
                  runSpacing: 20.0,
                  children: [
                    GestureDetector(
                      onTap:() {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => HomeDealzLevel1Screen(),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.black, // Màu nền của nút
                          borderRadius: BorderRadius.circular(30), // Bo góc
                        ),
                        child: Center(
                          child: Text(
                           'Home dealz',
                            style: const TextStyle(
                              color: Colors.white, // Màu chữ
                              fontSize: 16, // Kích thước chữ
                              fontWeight: FontWeight.bold, // In đậm chữ
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:() {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => D4Q4Screen(),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                          color: Colors.black, // Màu nền của nút
                          borderRadius: BorderRadius.circular(30), // Bo góc
                        ),
                        child: Center(
                          child: Text(
                            'D4 Q4',
                            style: const TextStyle(
                              color: Colors.white, // Màu chữ
                              fontSize: 16, // Kích thước chữ
                              fontWeight: FontWeight.bold, // In đậm chữ
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
