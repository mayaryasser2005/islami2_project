import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        const Divider(),
        Text(
          "Hadiths".tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 1,
                  ),
              itemCount: allahaddeth.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AhadethDetails.routeNamed,
                        arguments: allahaddeth[index]);
                  },
                  child: Text(
                    allahaddeth[index].title,
                    style: Theme.of(context).textTheme.bodyMedium,
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
