import 'package:get/get.dart';

import '../viewModel/home_view_model.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
  }
}
