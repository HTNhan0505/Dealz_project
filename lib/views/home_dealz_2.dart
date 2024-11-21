import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomeDealz2Screen extends StatefulWidget {
  const HomeDealz2Screen({super.key});

  @override
  State<HomeDealz2Screen> createState() => _HomeDealz2ScreenState();
}

class _HomeDealz2ScreenState extends State<HomeDealz2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'BƯỚC 2',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
            ),
            SizedBox(height: 40),
            Text(
              'Xin vui lòng đọc qua bản thông tin bảo mật, không tiết lộ việc mình là thành viên của Dealz cho cá nhân hay tập thể nào khác, nếu không sẽ bị “truy cứu” trách nhiệm với mức thiệt hại tương tự do Dealz quy định. ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              width: double.infinity,
              height: 60,
              child: FloatingActionButton.extended(
                onPressed: () {

                },
                backgroundColor: AppColors.blackColor,
                label: const Text(
                  'Đồng ý',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center, // Màu chữ
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
