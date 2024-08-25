import 'package:flutter/material.dart';
import 'package:flutter_mayar/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../provider/myprovider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(18.0),
      color:
          pro.appTheme == ThemeMode.dark ? AppColors.primaryDark : Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("light",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: pro.appTheme == ThemeMode.light
                            ? AppColors.primary
                            : Colors.white,
                        fontSize: 24)),
                pro.appTheme == ThemeMode.dark ? SizedBox() : Icon(Icons.done)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: pro.appTheme == ThemeMode.dark
                            ? AppColors.accentDark
                            : Colors.black,
                        fontSize: 24)),
                pro.appTheme == ThemeMode.light
                    ? SizedBox()
                    : Icon(
                        Icons.done,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
