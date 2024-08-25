import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../model/sura_details_arguments.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/constants.dart';
import '../../../suradetails/suradetails.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildHeaderImage(),
        Expanded(
          flex: 70,
          child: Stack(alignment: Alignment.center, children: [
            Column(
              children: [
                buildDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "suraName".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "verses".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                buildDivider(),
                buildSuraList(),
              ],
            ),
            const VerticalDivider(
              width: 2,
              color: AppColors.primary,
              thickness: 3,
              indent: 10,
            )
          ]),
        )
      ],
    );
  }

  buildHeaderImage() => const Expanded(
        flex: 30,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(AppAssets.quranTabLogo),
            width: 205,
            height: 227,
          ),
        ),
      );

  buildDivider() => const Divider();

  buildSuraList() => Expanded(
      flex: 70,
      child: ListView.builder(
        itemCount: Constants.suraNames.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, SuraDetails.routeNamed,
                  arguments: SuraDetailsArgs(
                      suraname: Constants.suraNames[index],
                      filename: "${index + 1}.txt"));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  Constants.suraNames[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 25),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  Constants.versesNumber[index].toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 25),
                )
              ],
            ),
          );
        },
      ));
}
