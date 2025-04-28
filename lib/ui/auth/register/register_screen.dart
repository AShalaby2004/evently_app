import 'package:evently_app/ui/auth/login/login_screen.dart';
import 'package:evently_app/ui/home/widgets/customElevatedButton.dart';
import 'package:evently_app/ui/home/widgets/custom_text_field.dart';
import 'package:evently_app/ui/home/widgets/toggle_language.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: Text(AppLocalizations.of(context)!.register),
      ),
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
                  height: height * 0.20,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.iconName),
                  hintText: AppLocalizations.of(context)!.name,
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                  controller: nameController,
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
                  prefixIcon: Image.asset(AssetsManager.iconEmail),
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                  hintText: AppLocalizations.of(context)!.email,
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
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.iconPassword),
                  suffixIcon: Image.asset(AssetsManager.iconHidden),
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                  hintText: AppLocalizations.of(context)!.re_password,
                  controller: rePasswordController,
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
                Customelevatedbutton(
                    onButtonClick: register,
                    text: AppLocalizations.of(context)!.create_account),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_account,
                        style: Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginScreen.routeName);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: AppStyles.mudium16Primary.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryLight),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.003,
                ),
                ToggleLanguage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formkey.currentState?.validate() == true) {}
  }
}
