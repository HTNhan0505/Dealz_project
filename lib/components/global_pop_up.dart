import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class GlobalPopup {
  static final GlobalPopup _instance = GlobalPopup._internal();

  factory GlobalPopup() {
    return _instance;
  }

  GlobalPopup._internal();

  OverlayEntry? _overlayEntry;

  void show(
      BuildContext context, String title, String content, String? nameRoute) {
    _overlayEntry = _createOverlayEntry(title, content, nameRoute);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(
      String title, String content, String? nameRoute) {
    return OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Material(
          color: AppColors.blackColor.withOpacity(0.5),
          child: Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    content,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            hide();
                          },
                          child: const Text('Từ chối',
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                        ),
                        TextButton(
                          onPressed: () {
                            if (nameRoute != null) {
                              hide();
                              Navigator.pushNamed(context, nameRoute);
                            } else {
                              hide();
                            }
                          },
                          child: const Text('Đồng ý',
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
