import 'package:flutter/material.dart';
import 'package:islamy_application/common/app_theme.dart';
import 'package:islamy_application/providers/theme_provider.dart';
import 'package:islamy_application/ui/screens/hadeth_screen.dart';
import 'package:islamy_application/ui/screens/home_screen.dart';
import 'package:islamy_application/ui/screens/quraan_screen.dart';
import 'package:islamy_application/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(Provider.of<ThemeProvider>(context).localeCode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).appThemeMode,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuraanScreen.routeName: (_) => const QuraanScreen(),
        HadethScreen.routeName: (_) => const HadethScreen()
      },
    );
  }
}
