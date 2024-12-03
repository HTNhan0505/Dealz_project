import 'dart:math';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/cancel_deal.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class D8Q7Screen extends StatefulWidget {
  D8Q7Screen({
    super.key,
  });

  @override
  State<D8Q7Screen> createState() => _D8Q7ScreenState();
}

class _D8Q7ScreenState extends State<D8Q7Screen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: isLoading
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'thông báo',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Bạn đã bị phạt vì can thiệp vào Quest của người chơi khác.',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: const Text('thoát',
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // Đẩy nút NEXT xuống cuối
                        children: [
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Text(
                                  'QUEST 6',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  'Giết chết Liêm',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          CancelDeal(titleSuccess: 'KHAI TỬ'),
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                decoration: BoxDecoration(
                                  color: Colors.black, // Màu nền của nút
                                  borderRadius:
                                      BorderRadius.circular(30), // Bo góc
                                ),
                                child: const Center(
                                  child: Text(
                                    'HOÀN THÀNH',
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
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
