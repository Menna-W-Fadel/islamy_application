import 'package:flutter/material.dart';
import 'package:islamy_application/common/app_images.dart';
import 'package:islamy_application/providers/theme_provider.dart';
import 'package:islamy_application/ui/tabs/hadeth_tab.dart';
import 'package:islamy_application/ui/tabs/quraan_tab.dart';
import 'package:islamy_application/ui/tabs/radio_tab.dart';
import 'package:islamy_application/ui/tabs/sebha_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs = [
    QuraanTab(),
    HadethTab(),
    const SebhaTab(),
    const RadioTab(),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    String bgImage = provider.isDark ? AppImages.bgDark : AppImages.bgLight;
    String darwerImage =
        provider.isDark ? AppImages.drawerDark : AppImages.drawerLight;

    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            )),
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.islamy),
              ),
              drawer: Drawer(
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(darwerImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(AppLocalizations.of(context)!.settings),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SwitchListTile(
                      value: provider.isDark,
                      title: Row(
                        children: [
                          const Icon(Icons.dark_mode),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: Text(AppLocalizations.of(context)!.darkMode),
                          )
                        ],
                      ),
                      onChanged: (value) {
                        provider.changeThemeMode(
                            value ? ThemeMode.dark : ThemeMode.light);
                      },
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(AppLocalizations.of(context)!.lang),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                        child: DropdownButton<String>(
                          dropdownColor:
                              Theme.of(context).colorScheme.onPrimary,
                          underline: Container(),
                          value: provider.localeCode,
                          focusColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          items: const [
                            DropdownMenuItem(
                              value: 'en',
                              child: Text('English'),
                            ),
                            DropdownMenuItem(
                              value: 'ar',
                              child: Text('Arabic'),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              provider.changeAppLocale(value);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: tabs[index],
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: index,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage(AppImages.quranIcon),
                          size: 37,
                        ),
                        label: AppLocalizations.of(context)!.quraan),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage(AppImages.hadethIcon),
                          size: 30,
                        ),
                        label: AppLocalizations.of(context)!.hadeth),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage(AppImages.sebhaIcon),
                          size: 37,
                        ),
                        label: AppLocalizations.of(context)!.tasbeh),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage(AppImages.radioIcon),
                          size: 30,
                        ),
                        label: AppLocalizations.of(context)!.radio),
                  ]),
            )));
  }
}
