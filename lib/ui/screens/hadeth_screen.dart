import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_application/common/app_images.dart';
import 'package:islamy_application/providers/theme_provider.dart';
import 'package:islamy_application/ui/tabs/hadeth_tab.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});
  static String routeName = "HadethScreen";
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<String> hadith = [];
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    String bgImage = provider.isDark ? AppImages.bgDark : AppImages.bgLight;
    HadethModel hadethModel =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    if (hadith.isEmpty) loadSuraContent(hadethModel.index);
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            )),
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Islamy",
                ),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.05,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      hadethModel.name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onError),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width * 0.15,
                      indent: MediaQuery.of(context).size.width * 0.15,
                    ),
                    hadith.isEmpty
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) => Text(
                                hadith[index],
                                style: Theme.of(context).textTheme.bodyLarge,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                              itemCount: hadith.length,
                            ),
                          )
                  ],
                ),
              ),
            )));
  }

  Future<void> loadSuraContent(int index) async {
    //Future.delayed(Duration(seconds: 30));
    String suraContent =
        await rootBundle.loadString("assets/hadeth/h${index + 1}.txt");
    hadith = suraContent.split('\n');
    setState(() {});
  }
}
