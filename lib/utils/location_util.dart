
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

import '../viewModel/home_view_model.dart';

class LocationUtil {
  LocationUtil.init();
  static LocationUtil instance = LocationUtil.init();

  final Location _location = Location();
  Future<bool> checkForServiceAvailability() async {
    bool isEnabled = await _location.serviceEnabled();
    if (isEnabled) {
      return Future.value(true);
    }

    isEnabled = await _location.requestService();

    if (isEnabled) {
      return Future.value(true);
    }

    return Future.value(false);
  }

  Future<bool> checkForPermission() async {
    PermissionStatus status = await _location.hasPermission();

    if (status == PermissionStatus.denied) {
      status = await _location.requestPermission();
      if (status == PermissionStatus.granted) {
        return true;
      }
      return false;
    }
    if (status == PermissionStatus.deniedForever) {
      Get.snackbar("Permission Needed",
          "We use permission to get your location in order to give your service",
          onTap: (snack) async {
            await handler.openAppSettings();
          }).show();
      return false;
    }

    return Future.value(true);
  }

  Future<void> getUserLocation({required HomeViewModel controller}) async {
    controller.updateIsAccessingLocation(true);
    if (!(await checkForServiceAvailability())) {
      debugPrint('Service -------');
      controller.errorDescription.value = "Service not enabled";
      controller.updateIsAccessingLocation(false);

      return;
    }
    if (!(await checkForPermission())) {
      debugPrint('Permision -------');

      controller.errorDescription.value = "Permission not given";
      controller.updateIsAccessingLocation(false);
      return;
    }

    final LocationData data = await _location.getLocation();
    controller.updateUserLocation(data);
    controller.updateIsAccessingLocation(false);
  }
}