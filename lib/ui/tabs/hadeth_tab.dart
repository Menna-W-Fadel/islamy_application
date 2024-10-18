import 'package:flutter/material.dart';
import 'package:islamy_application/common/app_images.dart';
import 'package:islamy_application/ui/screens/hadeth_screen.dart';

// ignore: must_be_immutable
class HadethTab extends StatelessWidget {
  HadethTab({super.key});
  List<String> ahadithList = [
    "الحديث الأول",
    "الحديث الثاني",
    "الحديث الثالث",
    "الحديث الرابع",
    "الحديث الخامس",
    "الحديث السادس",
    "الحديث السابع",
    "الحديث الثامن",
    "الحديث التاسع",
    "الحديث العاشر",
    "الحديث الحادي عشر",
    "الحديث الثاني عشر",
    "الحديث الثالث عشر",
    "الحديث الرابع عشر",
    "الحديث الخامس عشر",
    "الحديث السادس عشر",
    "الحديث السابع عشر",
    "الحديث الثامن عشر",
    "الحديث التاسع عشر",
    "الحديث العشرون",
    "الحديث الحادي والعشرون",
    "الحديث الثاني والعشرون",
    "الحديث الثالث والعشرون",
    "الحديث الرابع والعشرون",
    "الحديث الخامس والعشرون",
    "الحديث السادس والعشرون",
    "الحديث السابع والعشرون",
    "الحديث الثامن والعشرون",
    "الحديث التاسع والعشرون",
    "الحديث الثلاثون",
    "الحديث الحادي والثلاثون",
    "الحديث الثاني والثلاثون",
    "الحديث الثالث والثلاثون",
    "الحديث الرابع والثلاثون",
    "الحديث الخامس والثلاثون",
    "الحديث السادس والثلاثون",
    "الحديث السابع والثلاثون",
    "الحديث الثامن والثلاثون",
    "الحديث التاسع والثلاثون",
    "الحديث الأربعون",
    "الحديث الحادي والأربعون",
    "الحديث الثاني والأربعون",
    "الحديث الثالث والأربعون",
    "الحديث الرابع والأربعون",
    "الحديث الخامس والأربعون",
    "الحديث السادس والأربعون",
    "الحديث السابع والأربعون",
    "الحديث الثامن والأربعون",
    "الحديث التاسع والأربعون",
    "الحديث الخمسون"
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String quranStarImage =
        isDarkMode ? AppImages.quraanStarDark : AppImages.quraanStarGold;
    String arrowImage = isDarkMode ? AppImages.arrowDark : AppImages.arrowGold;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Image.asset(
            AppImages.hadethHeadImage,
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      HadethScreen.routeName,
                      arguments:
                          HadethModel(name: ahadithList[index], index: index),
                    );
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Stack(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(quranStarImage),
                                  Positioned.fill(
                                    child: Center(
                                      child: Text(
                                        "${index + 1}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: -1,
                                left: MediaQuery.of(context).size.width * 0.12,
                                child: Text(
                                  ahadithList[index],
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.01,
                                  child: Image.asset(arrowImage))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      )
                    ],
                  ),
                ),
              ),
              itemCount: ahadithList.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 0.4,
                  indent: MediaQuery.of(context).size.width * 0.05,
                  endIndent: MediaQuery.of(context).size.width * 0.05,
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          )
        ],
      ),
    );
  }
}

class HadethModel {
  String name;
  int index;
  HadethModel({required this.name, required this.index});
}
