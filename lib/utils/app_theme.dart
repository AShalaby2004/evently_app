import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    focusColor: AppColors.whiteBgColor,
    primaryColor: AppColors.primaryLight,
    hintColor: AppColors.blackColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyles.medium16Black,
    ),
    appBarTheme:
        AppBarTheme(iconTheme: IconThemeData(color: AppColors.primaryLight)),
    textTheme: TextTheme(
        headlineLarge: AppStyles.bold20Primary,
        headlineMedium: AppStyles.bold20Primary,
        headlineSmall:
            AppStyles.bold16Primary.copyWith(fontWeight: FontWeight.w700),
        bodyLarge: AppStyles.bold14Black
            .copyWith(fontWeight: FontWeight.w100, fontSize: 14)),
    scaffoldBackgroundColor: AppColors.whiteColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.whiteColor,
        selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      shape: StadiumBorder(
        side: BorderSide(
          color: AppColors.whiteColor,
          width: 4,
        ),
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    focusColor: AppColors.primaryLight,
    primaryColor: AppColors.primaryDark,
    hintColor: AppColors.whiteColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyles.medium16White,
    ),
    appBarTheme:
        AppBarTheme(iconTheme: IconThemeData(color: AppColors.primaryLight)),
    textTheme: TextTheme(
        headlineLarge: AppStyles.bold20White,
        headlineMedium: AppStyles.bold20Black,
        headlineSmall: AppStyles.regular14White
            .copyWith(fontSize: 16, fontWeight: FontWeight.w800),
        bodyLarge: AppStyles.bold16White
            .copyWith(fontSize: 14, fontWeight: FontWeight.w100)),
    scaffoldBackgroundColor: AppColors.primaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.whiteColor,
        selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: StadiumBorder(
        side: BorderSide(
          color: AppColors.whiteColor,
          width: 4,
        ),
      ),
    ),
  );
}
