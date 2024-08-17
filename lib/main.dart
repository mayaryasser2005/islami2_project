import 'package:flutter/material.dart';
import 'package:islami2_project/screens/ahadethdetails/ahadethdetails.dart';
import 'package:islami2_project/screens/home/home.dart';
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
      routes: {
        Splash.routeNamed: (_) => const Splash(),
        Home.routeNamed: (_) => const Home(),
        SuraDetails.routeNamed: (_) => SuraDetails(),
        AhadethDetails.routeNamed: (_) => AhadethDetails()
      },
      initialRoute: Splash.routeNamed,
    );
  }
}

