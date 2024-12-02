import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorPopUp2 {
  static final ErrorPopUp2 _instance = ErrorPopUp2._internal();

  factory ErrorPopUp2() {
    return _instance;
  }

  ErrorPopUp2._internal();

  OverlayEntry? _overlayEntry;

  void show(BuildContext context, String title, String content,
      Function()? onPressed) {
    _overlayEntry = _createOverlayEntry(title, content, onPressed);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(
      String title, String content, Function()? onPressed) {
    return OverlayEntry(
      builder: (context) => Positioned.fill(
        child: GestureDetector(
          onTap: hide,
          child: Material(
            color: AppColors.blackColor.withOpacity(0.5),
            child: Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      content,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
