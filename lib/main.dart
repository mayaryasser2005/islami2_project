import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami2_project/screens/ahadethdetails/ahadethdetails.dart';
import 'package:islami2_project/screens/home/home.dart';
import 'package:islami2_project/screens/home/tabs/setting/setting.dart';
import 'package:islami2_project/screens/splash/splash.dart';
import 'package:islami2_project/screens/suradetails/suradetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar"), Locale("en")],
      locale: Locale("ar"),
      routes: {
        Splash.routeNamed: (_) => const Splash(),
        Home.routeNamed: (_) => const Home(),
        SuraDetails.routeNamed: (_) => SuraDetails(),
        AhadethDetails.routeNamed: (_) => AhadethDetails(),
        Setting.routeNamed: (_) => Setting()
      },
      initialRoute: Splash.routeNamed,
    );
  }
}

