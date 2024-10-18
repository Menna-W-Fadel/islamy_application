import 'package:flutter/material.dart';
import 'package:islamy_application/common/app_images.dart';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotationAngle = 0;
  int tasbehCount = 0;
  List<String> tasbehList = [
    "الحمدالله",
    "سبحان الله",
    "الله أكبر",
    "لا إله إلا الله"
  ];
  String currentTasbeh = "الحمدالله";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Transform.rotate(
          angle: rotationAngle,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 55),
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AppImages.sebhaBodyDark,
                      width: MediaQuery.of(context).size.width * 0.33,
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * -0.086,
                        left: MediaQuery.of(context).size.width * 0.158,
                        child: Image.asset(
                          AppImages.sebhaHeadDark,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.tasbehCount,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          tasbehCount.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                rotateCircle();
                tasbehCount++;
                if (tasbehCount <= 99) {
                  if (tasbehCount % 33 == 0) {
                    currentTasbeh = tasbehList[tasbehCount ~/ 33];
                  }
                }
                if (tasbehCount == 100) {
                  tasbehCount = 0;
                  currentTasbeh = tasbehList[0];
                  rotationAngle = 0;
                }
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                currentTasbeh,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                tasbehCount = 0;
                currentTasbeh = "الحمدالله";
                rotationAngle = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                AppLocalizations.of(context)!.reset,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  rotateCircle() {
    setState(() {
      rotationAngle += 10 * pi / 180; // Convert 10 degrees to radians
    });
  }
}
