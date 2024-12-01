import 'package:dealz_app/components/success_q3_map.dart';
import 'package:dealz_app/utils/routes/routes_names.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../resources/colors/app_colors.dart';

class D3Q3Screen extends StatefulWidget {
  const D3Q3Screen({super.key});

  @override
  State<D3Q3Screen> createState() => _D3Q3ScreenState();
}

class _D3Q3ScreenState extends State<D3Q3Screen> {
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QUEST 3'),
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
                      'Bước 1: Đi đến kho hàng theo địa chỉ (link maps) và chờ hướng dẫn...',
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
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
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
                              MaterialPageRoute(
                                  builder: (context) => SuccessQ3Map(
                                        autoCountDown: true,
                                        nameBtn: 'HOÀN THÀNH',
                                        nameQuest:
                                            'Bước 3, gia công tất cả số kem duỡng trong thùng nhựa vào tuýp kem dưỡng và trưng bày như một kho hàng thực tế. Bạn có 6 tiếng để thực hiện Quest 3.',
                                        showNextBtn: true,
                                        titleQuest: 'QUEST 3',

                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.black, // Màu nền của nút
                            borderRadius: BorderRadius.circular(30), // Bo góc
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
