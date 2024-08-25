import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mayar/provider/myprovider.dart';
import 'package:flutter_mayar/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:flutter_mayar/screens/home/tabs/quran/quran.dart';
import 'package:flutter_mayar/screens/home/tabs/radio/MyRadio.dart';
import 'package:flutter_mayar/screens/home/tabs/sebha/sebha.dart';
import 'package:flutter_mayar/screens/home/tabs/setting/setting.dart';
import 'package:provider/provider.dart';

import '../../utils/app_assets.dart';

class Home extends StatefulWidget {
  static const String routeNamed = "Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int sellectedTabIndex = 4;
  List<Widget> tabs = const [MyRadio(), Sebha(),
    Ahadeth(),
    Quran(), Setting()];
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Stack(children: [
      Image.asset(pro.appTheme == ThemeMode.dark
          ? AppAssets.backgroundDark
          : AppAssets.mainBackgraond),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "islami".tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: tabs[sellectedTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: sellectedTabIndex,
          onTap: (index) {
            sellectedTabIndex = index;
            setState(() {});
          },
          // selectedItemColor: AppColors.accentDark,

          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.icRadio),
                ),
                label: "radio"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icKtab)),
                label: "ahadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icMoshaf)),
                label: "quran"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "setting"),
          ],
        ),
      ),
    ]);

    //   AppScaffoled(
    //   appBarTitle: 'Islami'.tr(),
    //   body: tabs[sellectedTabIndex],
    //   bottomNavigationBar: Theme(
    //     data: ThemeData(
    //       canvasColor: AppColors.primary,
    //     ),
    //     child: BottomNavigationBar(
    //       currentIndex: sellectedTabIndex,
    //       onTap: (index) {
    //         sellectedTabIndex = index;
    //         setState(() {});
    //       },
    //       selectedItemColor: Colors.black,
    //       items: const [
    //         BottomNavigationBarItem(
    //             icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "radio"),
    //         BottomNavigationBarItem(
    //             icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "sebha"),
    //         BottomNavigationBarItem(
    //             icon: ImageIcon(AssetImage(AppAssets.icKtab)),
    //             label: "ahadeth"),
    //         BottomNavigationBarItem(
    //             icon: ImageIcon(AssetImage(AppAssets.icMoshaf)),
    //             label: "quran"),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.settings),
    //             label: "setting"),
    //       ],
    //     ),
    //   ),
    // );
  }
}
