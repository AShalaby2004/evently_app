import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventDateOrTime extends StatelessWidget {
  String iconDateOrTime;
  String eventDateOrTime;
  String chooseDateOrTime;
  Function oncChooseDateOrTime;
  EventDateOrTime(
      {required this.iconDateOrTime,
      required this.chooseDateOrTime,
      required this.eventDateOrTime,
      required this.oncChooseDateOrTime});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image.asset(
          iconDateOrTime,
          color: Theme.of(context).hintColor,
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Expanded(
          child: Text(
            eventDateOrTime,
            style: Theme.of(context)
                .inputDecorationTheme
                .hintStyle
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            return oncChooseDateOrTime();
          },
          child: Text(
            chooseDateOrTime,
            style: AppStyles.bold16Primary.copyWith(fontSize: 16),
          ),
        )
      ],
    );
  }
}
