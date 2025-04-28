import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Customelevatedbutton extends StatelessWidget {
  Function onButtonClick;
  String text;
  Color? backgroundColor;
  TextStyle? style;
  Customelevatedbutton(
      {required this.onButtonClick,
      required this.text,
      this.backgroundColor,
      this.style});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: height * 0.014),
        backgroundColor: backgroundColor ?? AppColors.primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {
        onButtonClick();
      },
      child: Text(
        text,
        style: style ??
            AppStyles.mudium16White
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
