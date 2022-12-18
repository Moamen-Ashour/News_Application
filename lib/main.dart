
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'shared/styles/ThemeOfData.dart';
import 'layout/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home_Screen.routeName,
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
