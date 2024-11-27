import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AccountBankPopUp {
  static final AccountBankPopUp _instance = AccountBankPopUp._internal();

  factory AccountBankPopUp() {
    return _instance;
  }

  AccountBankPopUp._internal();

  OverlayEntry? _overlayEntry;

  void show(BuildContext context, Function()? onPressed) {
    _overlayEntry = _createOverlayEntry(onPressed);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(Function()? onPressed) {
    return OverlayEntry(
      builder: (context) => Positioned.fill(
        child: GestureDetector(
          onTap: hide,
          child: Material(
            color: AppColors.blackColor.withOpacity(0.5),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Thông tin tài khoản",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundBankTextField,
                        hintText: "Số tài khoản",
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white, // Màu chữ khi nhập
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundBankTextField,
                        hintText: "Tên ngân hàng",
                        hintStyle: const TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white, // Màu chữ khi nhập
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.9,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Màu nền nút
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Bo góc
                          ),
                        ),
                        child: const Text(
                          "XÁC NHẬN",
                          style: TextStyle(
                            color: Colors.white, // Màu chữ
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2, // Khoảng cách giữa các chữ cái
                          ),
                        ),
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
