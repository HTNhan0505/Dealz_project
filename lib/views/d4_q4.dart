import 'package:dealz_app/views/d4_q4_step_2.dart';
import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';

class D4Q4Screen extends StatefulWidget {
  const D4Q4Screen({super.key});

  @override
  State<D4Q4Screen> createState() => _D4Q4ScreenState();
}

class _D4Q4ScreenState extends State<D4Q4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QUEST 4'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Bước 1, tăng ca ở lại văn phòng SM GROUPS cho đến khi không còn nhân viên nào khác.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => D4Q4Step2(),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.black, // Màu nền của nút
                            borderRadius: BorderRadius.circular(16), // Bo góc
                          ),
                          child: const Center(
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                color: Colors.white, // Màu chữ
                                fontSize: 16, // Kích thước chữ
                                fontWeight: FontWeight.bold, // In đậm chữ
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
