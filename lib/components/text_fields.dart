import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;

  const CustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowTextFieldColor,
              blurRadius: 20,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ]),
      child: TextField(
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLength: 32,
        maxLines: 1,

        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: AppColors.blackColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          counterText: "",
          fillColor: AppColors.whiteColor,
          labelStyle: TextStyle(color: AppColors.placeholderTextField),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.transparentColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
