import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mayar/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../provider/myprovider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {},
            child: InkWell(
              onTap: () {
                pro.changeLanguage(Locale("ar"));
                pro.getThemeLang();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("arabic".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.primary, fontSize: 24)),
                  Icon(
                    Icons.done,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: InkWell(
              onTap: () {
                pro.changeLanguage(Locale("en"));
                pro.getThemeLang();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("english".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.primary, fontSize: 24)),
                  Icon(
                    Icons.done,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
