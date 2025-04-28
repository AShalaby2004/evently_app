import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/provider/language_provider.dart';
import 'package:evently_app/ui/auth/register/register_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/home/widgets/customElevatedButton.dart';
import 'package:evently_app/ui/home/widgets/custom_text_field.dart';
import 'package:evently_app/ui/home/widgets/toggle_language.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  int languageToggle = 0;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.04),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AssetsManager.logoTop,
                  height: height * 0.25,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.iconEmail),
                  hintText: AppLocalizations.of(context)!.email,
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter event title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.iconPassword),
                  suffixIcon: Image.asset(AssetsManager.iconHidden),
                  hintText: AppLocalizations.of(context)!.password,
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter event title';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          textAlign: TextAlign.end,
                          AppLocalizations.of(context)!.forget_password,
                          style: AppStyles.bold16Primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight),
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Customelevatedbutton(
                    onButtonClick: login,
                    text: AppLocalizations.of(context)!.login),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dont_have_account,
                        style: Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.create_account,
                            style: AppStyles.mudium16Primary.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryLight),
                          )),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: AppColors.primaryLight,
                      indent: width * 0.02,
                      endIndent: width * 0.02,
                    )),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: AppStyles.mudium16Primary
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      color: AppColors.primaryLight,
                      indent: width * 0.02,
                      endIndent: width * 0.02,
                    )),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(height: height * 0.02),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.transparentColor,
                    side: BorderSide(color: AppColors.primaryLight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.014),
                  ),
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsManager.iconGoogle,
                    height: 24,
                    width: 24,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.login_with_google,
                    style: AppStyles.mudium16Primary
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ToggleLanguage(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formkey.currentState?.validate() == true) {
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }
  }
}
