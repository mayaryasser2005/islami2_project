import 'package:flutter/material.dart';

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
      child: Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: body,
      ),
    );
  }

  buildAppBar() => AppBar(
      title: Text(appBarTitle!,
          style: AppStyle.appBartextstyle.copyWith(color: Colors.white)));

  buildBottomNavigationBar() => bottomNavigationBar;
}
