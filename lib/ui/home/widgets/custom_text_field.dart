import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  Color? borderColor;
  String? hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? labelText;
  TextStyle? labelStyle;
  int? maxLines;
  TextEditingController? controller;
  MyValidator? validator;

  CustomTextField(
      {this.borderColor,
      this.controller,
      this.validator,
      required this.hintText,
      this.suffixIcon,
      this.hintStyle,
      this.prefixIcon,
      this.labelText,
      this.labelStyle,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.greyColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.greyColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.redColor,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.redColor,
              width: 1,
            ),
          ),
          hintText: hintText,
          hintStyle: hintStyle ?? AppStyles.mudium16Black,
          labelText: labelText,
          labelStyle: labelStyle ?? AppStyles.bold14Primary,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
