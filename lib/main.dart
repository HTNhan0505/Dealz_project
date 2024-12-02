import 'package:dealz_app/provider/time_provider.dart';
import 'package:dealz_app/utils/location_util.dart';
import 'package:dealz_app/viewModel/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'components/notification_global.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationPermission = await Permission.notification.status;
  if (notificationPermission.isDenied) {
    await Permission.notification.request();
  }


  await NotificationService().init();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocationController locationController =
      Get.put<LocationController>(LocationController());

  @override
  void initState() {
    LocationService.instance.getUserLocation(controller: locationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeProvider(),
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.homeDealzLevel1,
        onGenerateRoute: Routes.generateRoutes,
        builder: EasyLoading.init(),
      ),
    );
  }
}
