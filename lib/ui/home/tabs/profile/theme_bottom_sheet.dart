import 'package:evently_app/provider/language_provider.dart';
import 'package:evently_app/provider/theme_prodiver.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProdiver>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
              },
              child: themeProvider.currentTheme == ThemeMode.dark
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.dark)),
          SizedBox(
            height: height * 0.04,
          ),
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
              },
              child: themeProvider.currentTheme == ThemeMode.light
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.light))
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: AppColors.primaryLight),
        ),
        Icon(
          Icons.check,
          color: AppColors.primaryLight,
          size: 30,
        )
      ],
    );
  }

  Widget getUnselectedItemWidget(String text) {
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}
