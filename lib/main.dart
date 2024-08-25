import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mayar/provider/myprovider.dart';
import 'package:flutter_mayar/screens/ahadethdetails/ahadethdetails.dart';
import 'package:flutter_mayar/screens/home/home.dart';
import 'package:flutter_mayar/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:flutter_mayar/screens/splash/splash.dart';
import 'package:flutter_mayar/screens/suradetails/suradetails.dart';
import 'package:flutter_mayar/widgets/my_theme_data.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        )
      ],
      builder: (context, child) {
        var pro = Provider.of<MyProvider>(context);
        return EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path: 'assets/translations',
            startLocale: Locale(pro.langCode),
            fallbackLocale: Locale(pro.langCode),
            child: MyApp());
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: pro.appTheme,
      theme: MyThemeData.ligthTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        Splash.routeNamed: (_) => const Splash(),
        Home.routeNamed: (_) => const Home(),
        SuraDetails.routeNamed: (_) => SuraDetails(),
        AhadethDetails.routeNamed: (context) => AhadethDetails(),
        Ahadeth.routeNamed: (_) => Ahadeth(),
      },
      initialRoute: Splash.routeNamed,
    );
  }
}

