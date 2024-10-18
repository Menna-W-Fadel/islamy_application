import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_application/common/app_images.dart';
import 'package:islamy_application/providers/theme_provider.dart';
import 'package:islamy_application/ui/tabs/quraan_tab.dart';
import 'package:provider/provider.dart';

class QuraanScreen extends StatefulWidget {
  const QuraanScreen({super.key});
  static String routeName = "quraanScreen";

  @override
  State<QuraanScreen> createState() => _QuraanScreenState();
}

class _QuraanScreenState extends State<QuraanScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    String bgImage = provider.isDark ? AppImages.bgDark : AppImages.bgLight;
    String bsmAllahImage =
        provider.isDark ? AppImages.bsmAllahDark : AppImages.bsmAllahLight;
    QuraanModel quraanModel =
        ModalRoute.of(context)!.settings.arguments as QuraanModel;
    if (ayat.isEmpty) loadSuraContent(quraanModel.index);
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
                      "سورة ${quraanModel.name}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onError),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width * 0.15,
                      indent: MediaQuery.of(context).size.width * 0.15,
                    ),
                    ayat.isEmpty
                        ? const CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Image.asset(
                              bsmAllahImage,
                              width: MediaQuery.of(context).size.width * 0.40,
                            ),
                          ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Text(
                          ayat[index],
                          style: Theme.of(context).textTheme.bodyLarge,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: ayat.length,
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
        await rootBundle.loadString("assets/quraan/${index + 1}.txt");
    ayat = suraContent.split('\n');
    setState(() {});
  }
}
