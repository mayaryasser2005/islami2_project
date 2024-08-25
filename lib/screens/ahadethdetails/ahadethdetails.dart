import 'package:flutter/material.dart';
import 'package:flutter_mayar/utils/app_assets.dart';
import 'package:flutter_mayar/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../model/hadeth.dart';
import '../../provider/myprovider.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeNamed = "AhadethDetails";

  AhadethDetails({super.key});

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Stack(
      children: [
        Image.asset(pro.appTheme == ThemeMode.dark
            ? AppAssets.backgroundDark
            : AppAssets.mainBackgraond),
        Scaffold(
          backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            model.title,
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25),
            ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Card(
            child: ListView.builder(
                itemCount: model.content.length,
                itemBuilder: (context, index) {
                  return Text(
                    model.content[index],
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                          ?.copyWith(fontSize: 25, color: AppColors.accentDark),
                    );
                }),
          ),
        ),
        )
      ],
    );
  }
}