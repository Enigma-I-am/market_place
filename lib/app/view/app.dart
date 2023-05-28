import 'package:flutter/material.dart';
import 'package:market_place/core/navigator.dart';
import 'package:market_place/main_page/view/pages/splash_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.key,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFE6E8E7),
        ),
        scaffoldBackgroundColor: const Color(0xFFFBFBFB),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
