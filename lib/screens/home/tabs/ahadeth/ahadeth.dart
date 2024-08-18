import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../model/hadeth.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/constants.dart';
import '../../../ahadethdetails/ahadethdetails.dart';

class Ahadeth extends StatefulWidget {
  Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<Hadeth> hadethList = [];

  @override
  void initState() {
    super.initState();
    readahadethfile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 30,
            child: Center(child: Image.asset(AppAssets.AhadathTabLogo))),
        Expanded(
          flex: 70,
          child: Column(
            children: [
              builddivider(),
              const Text(
                "Hadiths",
                textAlign: TextAlign.center,
                style: AppStyle.titlestextstyle,
              ),
              builddivider(),
              buildahadethlist(),
            ],
          ),
        )
      ],
    );
  }

  //-------------------Important-----------------//

  // Note: Study it is important

  Future readahadethfile() async {
    String ahadethFileContant =
        await rootBundle.loadString(Constants.hadethFilePath);
    List<String> ahadethAsString = ahadethFileContant.split("#\r\n");
    for (int i = 0; i < ahadethAsString.length; i++) {
      String hadeth = ahadethAsString[i];
      List<String> hadethLines = hadeth.split("\n");
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContant = hadethLines.join();
      hadethList.add(Hadeth(hadethName, hadethContant));
    }
    setState(() {});
  }

  //-------------------Important-----------------//

  Expanded buildahadethlist() => Expanded(
        flex: 70,
        child: hadethList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.primary,
              ))
            : ListView.builder(
                itemCount: hadethList.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AhadethDetails.routeNamed,
                            arguments: hadethList[index]);
                      },
                      child: Row(
                        children: [
                          Expanded // اسماء الاحاديث
                              (
                                  flex: 50,
                                  child: Text(
                                    hadethList[index].title,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.titlestextstyle,
                                  )),
                        ],
                      ),
                    )),
      );

  Divider builddivider() => const Divider(
        color: AppColors.primary,
        thickness: 3,
        indent: 10,
      );
}
