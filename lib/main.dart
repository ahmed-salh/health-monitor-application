import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'google_login_controller.dart';
import 'localization/app_localiztion.dart';
import 'login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grad_app/localization/local_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInController(),
          child: LoginPage(),
        )
      ],
      child: ChangeNotifierProvider<LocalProvider>(
        create: (_) => LocalProvider(),
        lazy: false,
        child: Consumer<LocalProvider>(
          builder: (context, localeSnapshot, __) => MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Color(0xFF006064),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFF006064),
                ),
              ),
            ),
            supportedLocales: [
              const Locale('ar', ''),
              const Locale('en', 'US'),
            ],
            debugShowCheckedModeBanner: false,
            title: 'Health Tracker System',
            locale: localeSnapshot.appLocal,
            // These delegates make sure that the localization data for the proper language is loaded
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            // Returns a locale which will be used by the app
            localeResolutionCallback: (locale, supportedLocales) {
              // Check if the current device locale is supported
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode &&
                    supportedLocale.countryCode == locale!.countryCode) {
                  return supportedLocale;
                }
              }
              // If the locale of the device is not supported, use the first one
              // from the list (English, in this case).
              return localeSnapshot.appLocal;
            },
            home: LoginPage(
                //title: 'Health Monitor',
                ),
          ),
        ),
      ),
    );
  }
}
