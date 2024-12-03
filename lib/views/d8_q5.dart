import 'dart:math';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/d8_q7.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class D8q5Screen extends StatefulWidget {
  D8q5Screen({
    super.key,
  });

  @override
  State<D8q5Screen> createState() => _D8q5ScreenState();
}

class _D8q5ScreenState extends State<D8q5Screen> {
  bool isLoading = true;
  late GoogleMapController _mapController;
  LatLng _currentLocation = const LatLng(0, 0);
  Location _location = Location();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      var locationData = await _location.getLocation();
      setState(() {
        _currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
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
                          'Giữ Liêm ở vị trí hiện tại, chờ hướng dẫn tiếp theo',
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
                            child: const Text('Cancel',
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
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'QUEST 5',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Định vị Liêm',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          height: 700,
                          child: GestureDetector(
                            onVerticalDragUpdate: (_) {},
                            child: _currentLocation.latitude != 0
                                ? GoogleMap(
                                    onMapCreated: (controller) {
                                      _mapController = controller;
                                    },
                                    initialCameraPosition: CameraPosition(
                                      target: _currentLocation,
                                      zoom: 15,
                                    ),
                                    myLocationEnabled: true,
                                    myLocationButtonEnabled: true,
                                    gestureRecognizers: {
                                      Factory<OneSequenceGestureRecognizer>(
                                        () => EagerGestureRecognizer(),
                                      ),
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      'Đang tải bản đồ...',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 300),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => D8Q7Screen(),
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
                                    'NEXT',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
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
