import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../model/sura_details_arguments.dart';
import '../../provider/myprovider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';
import '../../widgets/app_scaffoled.dart';

class SuraDetails extends StatefulWidget {
  static const String routeNamed = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      readfile();
    }
    return Stack(children: [
      Image.asset(pro.appTheme == ThemeMode.dark
          ? AppAssets.backgroundDark
          : AppAssets.mainBackgraond),
      AppScaffoled(
        appBarTitle: args.suraname,
      body: fileContent.isEmpty ? buildLoading() : buildSuraContent(),
      ),
    ]);
  }

  Future<void> readfile() async {
    Future<String> futureFileContent =
        rootBundle.loadString("assets/quran/${args.filename}");
    fileContent = await futureFileContent;
    print(fileContent);
    List<String> fileLines = fileContent.split("\n");
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += "{${i + 1}}";
    }
    fileContent = fileLines.join(" ");
    setState(() {});
  }

  buildSuraContent() => Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: SingleChildScrollView(
            child: Text(
              fileContent,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: AppStyle.titlestextstyle.copyWith(fontSize: 20),
            ),
          ),
        ),
      );

  buildLoading() => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primary,
      ));
}
