import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/provider/language_provider.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/utils/app_colors.dart';

class ToggleLanguage extends StatefulWidget {
  @override
  State<ToggleLanguage> createState() => _ToggleLanguageState();
}

class _ToggleLanguageState extends State<ToggleLanguage> {
  int languageToggle = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.02),
        AnimatedToggleSwitch<int>.rolling(
          current: languageToggle,
          values: const [0, 1],
          onChanged: (i) {
            setState(() {
              languageToggle = i;
            });
            final languageProvider =
                Provider.of<LanguageProvider>(context, listen: false);
            languageProvider.changeLanguage(i == 0 ? 'en' : 'ar');
          },
          iconBuilder: (value, size) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              value == 0 ? AssetsManager.usaFlag : AssetsManager.egyptFlag,
            ),
          ),
          borderWidth: 2.0,
          height: 40,
          style: ToggleStyle(
            borderColor: AppColors.primaryLight,
            indicatorColor: AppColors.primaryLight,
            backgroundColor: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
