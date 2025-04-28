import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  String eventName;
  bool isSelected;
  Color? selectedBackgroundColor;
  TextStyle? selectedTextStyle;
  TextStyle? unSelectedTextStyle;
  Color? borderColor;

  EventTabItem(
      {required this.eventName,
      required this.isSelected,
      required this.selectedBackgroundColor,
      required this.selectedTextStyle,
      required this.unSelectedTextStyle,
      this.borderColor});
  @override
  Widget build(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      decoration: BoxDecoration(
          color:
              isSelected ? selectedBackgroundColor : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(46),
          border: Border.all(
            color: borderColor ?? AppColors.whiteColor,
            width: 1,
          )),
      child: Text(
        eventName,
        style: isSelected ? selectedTextStyle : unSelectedTextStyle,
      ),
    );
  }
}
