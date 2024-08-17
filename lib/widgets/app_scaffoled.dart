import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_style.dart';

class AppScaffoled extends StatelessWidget {
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;

  const AppScaffoled(
      {super.key, this.body, this.appBarTitle, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.mainBackgraond))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: body,
      ),
    );
  }

  buildAppBar() => AppBar(
        title: Text(appBarTitle!, style: AppStyle.appBartextstyle),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      );

  buildBottomNavigationBar() => bottomNavigationBar;
}
