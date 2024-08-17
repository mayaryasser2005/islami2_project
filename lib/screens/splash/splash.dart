import 'package:flutter/material.dart';
import 'package:islami2_project/screens/home/home.dart';

class Splash extends StatefulWidget {
  static const String routeNamed = "Splash";

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeNamed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/splash.png",
              ))),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
