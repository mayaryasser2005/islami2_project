import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mayar/provider/myprovider.dart';
import 'package:flutter_mayar/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/language_bottom_sheet.dart';
import '../../../../widgets/theme_bottom_sheet.dart';

class Setting extends StatelessWidget {
  static const String routeNamed = "Setting";

  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 12,
          ),
          Text("language".tr(), style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  //isDismissible: false,
                  builder: (context) {
                    return const LanguageBottomSheet();
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: AppColors.primary)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("english".tr(),
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text("theme".tr(), style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  //isDismissible: false,
                  builder: (context) {
                    return ThemeBottomSheet();
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: AppColors.primary)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    pro.appTheme == ThemeMode.dark ? "dark".tr() : "light".tr(),
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ),
          )
        ],
      ),
    );
  }
}
