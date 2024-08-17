import 'package:flutter/material.dart';
import 'package:islami2_project/utils/app_colors.dart';
import 'package:islami2_project/utils/app_style.dart';

class Setting extends StatefulWidget {
  static const String routeNamed = "Setting";

  Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String selectedLanguage = "en";

  bool isDarkThemeEnable = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Language",
            style: AppStyle.titlestextstyle,
          ),
          SizedBox(
            height: 18,
          ),
          buildLanguageMenu(),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Text(
                "Theme",
                style: AppStyle.titlestextstyle,
              ),
              Spacer(),
              buildThemeSwitch(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLanguageMenu() => DropdownButton(
        value: selectedLanguage,
        isExpanded: true,
        items: [
          DropdownMenuItem<String>(
            value: "ar",
            child: Text("اللغه العربيه"),
          ),
          DropdownMenuItem<String>(
            value: "en",
            child: Text("English"),
          )
        ],
        onChanged: (newValue) {
          selectedLanguage = newValue ?? selectedLanguage;
          setState(() {});
        },
      );

  buildThemeSwitch() => Switch(
      value: isDarkThemeEnable,
      activeColor: AppColors.primary,
      onChanged: (newValue) {
        isDarkThemeEnable = newValue;
        setState(() {});
      });
}
