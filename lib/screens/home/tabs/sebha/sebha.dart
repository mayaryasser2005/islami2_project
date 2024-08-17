import 'package:flutter/material.dart';

import '../../../../utils/app_assets.dart';

class Sebha extends StatefulWidget {
  static const routeNamed = "Sebha";

  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  List<String> buttonChange = ["سبحان الله", "الله اكبر", "الحمد لله"];
  String text = "سبحان الله"; // Initial text
  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 70,
            child: Stack(children: [
              Container(
                  margin: EdgeInsets.only(left: 60, top: 18),
                  alignment: Alignment.topCenter,
                  child: Image.asset(AppAssets.HeadOfSeb7a)),
              Container(
                alignment: Alignment.center,
                child: AnimatedRotation(
                  turns: _turns,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(AppAssets.SebhaTabLogo),
                ),
              ),
            ]),
          ),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 40),
          Expanded(
              flex: 30,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(199, 180, 150, 1.0),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      "$counter",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: add,
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(182, 146, 94, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ))
        ],
      ),
    );
  }

  void add() {
    setState(() {
      _turns += 0.05;
      counter++;
      updateText();
    });
  }

  void updateText() {
    setState(() {
      int index = (counter ~/ 33) % buttonChange.length;
      text = buttonChange[index];
    });
  }
}
