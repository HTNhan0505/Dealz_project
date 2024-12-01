import 'package:dealz_app/views/d4_q4_step_3.dart';
import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';

class D4Q4Step2 extends StatefulWidget {
  const D4Q4Step2({super.key});

  @override
  State<D4Q4Step2> createState() => _D4Q4Step2State();
}

class _D4Q4Step2State extends State<D4Q4Step2> {
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
                      'Bước 2, trong 1 phút sắp tới, camera trong văn phòng sẽ ngừng hoạt động trong suốt 1 giờ tiếp theo. Bạn phải đến tủ hồ sơ phía sau bàn của bộ phận thẩm định, tìm một bộ hồ sơ thẩm định có mã SM1272024.',
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
                                pageBuilder: (_, __, ___) => D4Q4Step3(
                                    autoCountDown: true,
                                    nameQuest:
                                        'Buớc 3, bạn phải sửa đổi con số thẩm định tài sản trong hồ sơ này từ 12 tỷ lên 20 tỷ đồng và trả về vị trí cũ. Đồng thời, gửi file mềm đã chỉnh sửa qua link sau <link>. Bạn có 12 tiếng để hoàn thành Quest 4.',
                                    showNextBtn: true,
                                    titleQuest: 'QUEST 4',
                                    nameBtn: 'NEXT'),
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
