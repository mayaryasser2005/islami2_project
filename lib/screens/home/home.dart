import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mayar/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:flutter_mayar/screens/home/tabs/quran/quran.dart';
import 'package:flutter_mayar/screens/home/tabs/radio/MyRadio.dart';
import 'package:flutter_mayar/screens/home/tabs/sebha/sebha.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_scaffoled.dart';

class Home extends StatefulWidget {
  static const String routeNamed = "Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int sellectedTabIndex = 3;
  List<Widget> tabs = [
    MyRadio(),
    Sebha(),
    Ahadeth(),
    Quran(),
  ];
  @override
  Widget build(BuildContext context) {
    return AppScaffoled(
      appBarTitle: 'Islami'.tr(),
      body: tabs[sellectedTabIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: AppColors.primary,
        ),
        child: BottomNavigationBar(
          currentIndex: sellectedTabIndex,
          onTap: (index) {
            sellectedTabIndex = index;
            setState(() {});
          },
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "radio"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icKtab)),
                label: "ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icMoshaf)),
                label: "quran"),
          ],
        ),
      ),
    );
  }
}
