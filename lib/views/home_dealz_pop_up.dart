import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';
import '../utils/routes/routes.dart';
import '../utils/routes/routes_names.dart';

class HomeDealzPopUp extends StatefulWidget {
  const HomeDealzPopUp({super.key});

  @override
  State<HomeDealzPopUp> createState() => _HomeDealzPopUpState();
}

class _HomeDealzPopUpState extends State<HomeDealzPopUp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Cho phép "DEALZ" định vị vị trí của bạn ?',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: (AppColors.borderDialog), width: 1),
                        bottom: BorderSide(
                            color: AppColors.borderDialog, width: 1))),
                child: TextButton(
                  child: const Text('Cho phép',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.homeDealz1);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextButton(
                  child: const Text('Không cho phép',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18,
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
