


import 'package:dealz_app/components/count_down_page.dart';
import 'package:dealz_app/components/success_deal.dart';
import 'package:dealz_app/utils/routes/routes_names.dart';
import 'package:dealz_app/views/home_dealz_2.dart';
import 'package:dealz_app/views/home_dealz_level_1.dart';
import 'package:dealz_app/views/home_dealz_pop_up.dart';
import 'package:flutter/material.dart';

import '../../views/home_dealz_1.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.homeDealz1):
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeDeal1Screen());
      case (RouteNames.homePopUp):
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeDealzPopUp());
      case (RouteNames.homeDealz2):
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeDealz2Screen());
      case (RouteNames.homeDealzLevel1):
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeDealzLevel1Screen());
      case (RouteNames.successScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => SuccessDeal(titleSuccess: '',));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}
