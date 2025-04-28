import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 15),
      clipBehavior: Clip.antiAlias,
      height: height * 0.31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(AssetsManager.sportImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.001),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor),
            child: Column(
              children: [
                Text(
                  '22',
                  style: AppStyles.bold20Primary,
                ),
                Text(
                  'Nov',
                  style: AppStyles.bold20Primary,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.001),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'We Are Going To Play Football',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsManager.iconFavorite,
                    color: AppColors.primaryLight,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
