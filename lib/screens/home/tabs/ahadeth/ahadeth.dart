import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mayar/utils/app_colors.dart';
import 'package:flutter_mayar/utils/app_style.dart';

import '../../../../model/hadeth.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/constants.dart';
import '../../../ahadethdetails/ahadethdetails.dart';

class Ahadeth extends StatefulWidget {
  static const String routeNamed = "ahadeth";

  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<HadethModel> allahaddeth = [];

  @override
  void initState() {
    super.initState();
    loadingHadethFile();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Image.asset(AppAssets.AhadathTabLogo),
          height: 219,
        ),
        const Divider(
          thickness: 2,
          color: AppColors.primary,
        ),
        Text(
          "Ahadeth",
          textAlign: TextAlign.center,
          style: AppStyle.appBartextstyle,
        ),
        const Divider(
          thickness: 2,
          color: AppColors.primary,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: allahaddeth.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AhadethDetails.routeNamed,
                        arguments: allahaddeth[index]);
                  },
                  child: Text(
                    allahaddeth[index].title,
                    style: AppStyle.titlestextstyle.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
        )
      ],
    );
  }

  loadingHadethFile() {
    rootBundle.loadString(Constants.hadethFilePath).then((value) {
      List<String> ahadeth = value.split("#");
      for (int i = 0; i < ahadeth.length; i++) {
        String hadeth = ahadeth[i];
        List<String> HadethLines = hadeth.trim().split("\n");
        String title = HadethLines[0];
        HadethLines.removeAt(0);
        List<String> content = HadethLines;
        HadethModel hadethModel = HadethModel(title, content);
        allahaddeth.add(hadethModel);
        setState(() {});
      }
    });
  }
}
