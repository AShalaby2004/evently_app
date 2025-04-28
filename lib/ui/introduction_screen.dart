import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/provider/language_provider.dart';
import 'package:evently_app/provider/theme_prodiver.dart';
import 'package:evently_app/ui/auth/login/login_screen.dart';
import 'package:evently_app/ui/home/widgets/toggle_language.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AppIntroductionScreen extends StatefulWidget {
  static const String routeName = 'onboarding';

  @override
  _AppIntroductionScreenState createState() => _AppIntroductionScreenState();
}

class _AppIntroductionScreenState extends State<AppIntroductionScreen> {
  int languageToggle = 0;
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPageIndex = 0;

  void goToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  void goToNextPage() {
    introKey.currentState?.next();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProdiver>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final isLightTheme = themeProvider.currentTheme == ThemeMode.light;

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrollPhysics: ClampingScrollPhysics(),
          onChange: (page) => setState(() => currentPageIndex = page),
          pages: [
            buildPage(
              imagePath: AssetsManager.onboarding1,
              title: AppLocalizations.of(context)!.personalize_experience,
              body: AppLocalizations.of(context)!.choose_theme_language,
              context: context,
              screenHeight: screenHeight,
              toggleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: AppStyles.bold16Primary,
                      ),
                      ToggleLanguage(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.theme,
                        style: AppStyles.bold16Primary,
                      ),
                      AnimatedToggleSwitch<bool>.rolling(
                        height: 40,
                        current: isLightTheme,
                        values: const [true, false],
                        onChanged: (value) {
                          themeProvider.changeTheme(
                              value ? ThemeMode.light : ThemeMode.dark);
                        },
                        iconBuilder: (value, size) => Icon(
                          value ? Icons.light_mode : Icons.dark_mode,
                          color: value
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                        borderWidth: 2.0,
                        style: ToggleStyle(
                          borderColor: AppColors.primaryLight,
                          indicatorColor: AppColors.primaryLight,
                          backgroundColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: goToNextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 110, vertical: 12),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.lets_start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildPage(
              imagePath: AssetsManager.onboarding2,
              title: AppLocalizations.of(context)!.find_inspiring_events,
              body: AppLocalizations.of(context)!.explore_events,
              context: context,
              screenHeight: screenHeight,
            ),
            buildPage(
              imagePath: AssetsManager.onboarding3,
              title: AppLocalizations.of(context)!.effortless_planning,
              body: AppLocalizations.of(context)!.event_planning,
              context: context,
              screenHeight: screenHeight,
            ),
            buildPage(
              imagePath: AssetsManager.onboarding4,
              title: AppLocalizations.of(context)!.connect_and_share,
              body: AppLocalizations.of(context)!.share_moments,
              context: context,
              screenHeight: screenHeight,
            ),
          ],
          showSkipButton: false,
          showNextButton: currentPageIndex != 0,
          showBackButton: currentPageIndex != 0,
          back: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryLight, width: 2),
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primaryLight,
              child: Icon(Icons.arrow_back, color: AppColors.primaryLight),
            ),
          ),
          next: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryLight, width: 2),
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primaryLight,
              child: Icon(Icons.arrow_forward, color: AppColors.primaryLight),
            ),
          ),
          done: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryLight, width: 2),
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primaryLight,
              child: Icon(Icons.arrow_forward, color: AppColors.primaryLight),
            ),
          ),
          onDone: () => goToHomeScreen(context),
          dotsDecorator: currentPageIndex == 0
              ? DotsDecorator(
                  size: Size.zero,
                  activeSize: Size.zero,
                  color: Colors.transparent,
                  activeColor: Colors.transparent,
                  spacing: EdgeInsets.zero,
                )
              : DotsDecorator(
                  size: Size(10, 10),
                  activeSize: Size(22, 10),
                  activeColor: AppColors.primaryLight,
                  color: AppColors.primaryLight.withOpacity(0.3),
                  spacing: EdgeInsets.symmetric(horizontal: 3),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
          dotsContainerDecorator: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  PageViewModel buildPage({
    required String imagePath,
    required String title,
    required String body,
    required BuildContext context,
    required double screenHeight,
    Widget? toggleWidget,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return PageViewModel(
      titleWidget: Text(
        title,
        style: AppStyles.bold20Primary,
      ),
      bodyWidget: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              body,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (toggleWidget != null) toggleWidget,
          ],
        ),
      ),
      image: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.02),
            height: screenHeight * 0.08,
            child: Image.asset(AssetsManager.logo),
          ),
          Container(
            height: screenHeight * 0.35,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ],
      ),
      decoration: PageDecoration(
        imagePadding: EdgeInsets.only(top: screenHeight * 0.02),
        titlePadding: EdgeInsets.fromLTRB(24, 0, 24, 16),
        bodyPadding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        pageColor: Colors.transparent,
        bodyFlex: 2,
        imageFlex: 3,
      ),
    );
  }
}
