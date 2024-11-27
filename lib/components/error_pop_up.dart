import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorPopUp {
  static final ErrorPopUp _instance = ErrorPopUp._internal();

  factory ErrorPopUp() {
    return _instance;
  }

  ErrorPopUp._internal();

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
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                    Container(
                      child:  TextButton(
                        onPressed: onPressed,
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
        ),
      ),
    );
  }
}
