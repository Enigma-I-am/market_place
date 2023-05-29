import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_place/core/navigator.dart';
import 'package:market_place/main_page/counter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        /* set Status bar color in Android devices. */
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        /* set Status bar icons color in Android devices.*/
        statusBarIconBrightness:
            (Platform.isIOS ? Brightness.light : Brightness.dark),
        /* set Status bar icon color in iOS. */
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator.key,
        theme: ThemeData(
          primaryColor: const Color(0xff4AB299),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Color(
              0xFFE6E8E7,
            ),
            color: Color(
              0xFFE6E8E7,
            ),
          ),
          scaffoldBackgroundColor: const Color(
            0xFFFBFBFB,
          ),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(
              0xFFE6E8E7,
            ),
          ),
        ),
        home: const MainScreen(),
      ),
    );
  }
}
