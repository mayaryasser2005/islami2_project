import 'package:flutter/material.dart';

import '../../model/hadeth.dart';
import '../../utils/app_style.dart';
import '../../widgets/app_scaffoled.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeNamed = "AhadethDetails";

  AhadethDetails({super.key});

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return AppScaffoled(
      appBarTitle: hadeth.title,
      body: buildHadethContent(hadeth.contant),
    );
  }

  buildHadethContent(String contant) => Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: SingleChildScrollView(
            child: Text(
              contant,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: AppStyle.titlestextstyle.copyWith(fontSize: 20),
            ),
          ),
        ),
      );
}
