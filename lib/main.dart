import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mayar/screens/ahadethdetails/ahadethdetails.dart';
import 'package:flutter_mayar/screens/home/home.dart';
import 'package:flutter_mayar/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:flutter_mayar/screens/home/tabs/setting/setting.dart';
import 'package:flutter_mayar/screens/splash/splash.dart';
import 'package:flutter_mayar/screens/suradetails/suradetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: Locale("ar"),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        Splash.routeNamed: (_) => const Splash(),
        Home.routeNamed: (_) => const Home(),
        SuraDetails.routeNamed: (_) => SuraDetails(),
        AhadethDetails.routeNamed: (_) => AhadethDetails(),
        Ahadeth.routeNamed: (_) => Ahadeth(),
        Setting.routeNamed: (_) => Setting()
      },
      initialRoute: Splash.routeNamed,
    );
  }
}

