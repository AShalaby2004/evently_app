import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/provider/language_provider.dart';
import 'package:evently_app/provider/theme_prodiver.dart';
import 'package:evently_app/ui/auth/login/login_screen.dart';
import 'package:evently_app/ui/auth/register/register_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/home/tabs/home_tab/add_event.dart';
import 'package:evently_app/ui/introduction_screen.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LanguageProvider()),
    ChangeNotifierProvider(create: (context) => ThemeProdiver()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var languageProvider = Provider.of<LanguageProvider>(context);
        var themeProvider = Provider.of<ThemeProdiver>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppIntroductionScreen.routeName,
          routes: {
            AppIntroductionScreen.routeName: (context) =>
                AppIntroductionScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            AddEvent.routeName: (context) => AddEvent(),
            LoginScreen.routeName: (context) => LoginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
          },
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(languageProvider.currentLocal),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.currentTheme,
        );
      },
    );
  }

  static void setLocale(BuildContext context, Locale locale) {}
}
