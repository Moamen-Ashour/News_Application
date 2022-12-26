


import 'package:coach_nearest/screens/tab_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:coach_nearest/shared/providers/appbar_icon_search.dart';
import 'package:coach_nearest/shared/providers/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import 'layout/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
   runApp(MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) { return appbar_title();}),
       ChangeNotifierProvider(create: (context) { return search_icon();}),
     ],
       child: MyApp())
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static  setLocale(BuildContext context,Locale newlocale){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newlocale);
  }
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   locale: _locale,
        initialRoute: Home_Screen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          Home_Screen.routeName: (_) => Home_Screen(),
        },
        debugShowCheckedModeBanner: false,
        // theme: ThemeOfData.LightTheme,
        // darkTheme: ThemeOfData.DarkTheme,
        // themeMode: ThemeMode.light,
    );
  }
}
