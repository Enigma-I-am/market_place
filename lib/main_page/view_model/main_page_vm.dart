import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_place/core/models/header_model.dart';
import 'package:market_place/core/navigator.dart';
import 'package:market_place/core/view_model/disposable_vm.dart';
import 'package:market_place/main_page/counter.dart';
import 'package:market_place/main_page/view/pages/home_page.dart';
import 'package:market_place/main_page/view/pages/voucher_page.dart';
import 'package:market_place/main_page/view/pages/wallet_page.dart';
import 'package:market_place/main_page/view/widgets/main_page_bottom_nav.dart';

class MainPageVM extends DisposableViewModel {
  MainPageVM(super.read);

  final pages = <MainPageTab>[
    const MainPageTab(
      page: HomePage(
        key: PageStorageKey<String>('home'),
      ),
      img: 'home',
      name: 'Home',
    ),
    const MainPageTab(
      page: VoucherPage(
        key: PageStorageKey<String>('voucher'),
      ),
      img: 'voucher',
      name: 'Voucher',
    ),
    const MainPageTab(
      page: WalletPage(
        key: PageStorageKey<String>('wallet'),
      ),
      img: 'wallet',
      name: 'Wallet',
    ),
    MainPageTab(
      page: Container(
        key: const PageStorageKey<String>('ic_gardener'),
        child: const Center(
          child: Text("Settings"),
        ),
      ),
      img: 'settings',
      name: 'Settings',
    ),
  ];

  final headers = <HeaderModel>[
    HeaderModel(
      hashTag: '#FASHION DAY',
      discount: '80% OFF',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hanger_removebg-preview%201.png?alt=media&token=ba79b8a0-258d-4796-84c1-97cc6136f2e8',
      subText: 'Discover fashion that\nsuits to your style',
    ),
    HeaderModel(
      hashTag: '#FASHION DAY',
      discount: '80% OFF',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/home_shirt.png?alt=media&token=d2580fb7-2f4a-40d8-82ca-831476485bfd',
      subText: 'Discover fashion that\nsuits to your style',
    ),
    HeaderModel(
      hashTag: '#FASHION DAY',
      discount: '80% OFF',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hanger_removebg-preview%201.png?alt=media&token=ba79b8a0-258d-4796-84c1-97cc6136f2e8',
      subText: 'Discover fashion that\nsuits to your style',
    ),
  ];

  final hoodieViews = <String>[
    "https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hoodie-back-removebg-preview.png?alt=media&token=e3a4fb26-9464-4e2a-8b7e-35bd20818a18",
    "https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hoodie-sleeve-removebg-preview.png?alt=media&token=b5480f9c-eb21-4353-8158-fba8b74df5f4",
    "https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hooddie-button.jpg?alt=media&token=f88b3cbe-0678-48f6-b809-dd2c37c97a00",
    "https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hoodie-pocket.jpg?alt=media&token=60b7e691-1bd2-4f64-84d5-a7d9dca98b2d",
  ];

  int _currentTab = 0;
  int get currentTab => _currentTab;
  set currentTab(int val) {
    _currentTab = val;
    notifyListeners();
  }

  int _currentHeader = 0;
  int get currentHeader => _currentHeader;
  set currentHeader(int val) {
    _currentHeader = val;
    notifyListeners();
  }

  int _currentOption = 0;
  int get currentOption => _currentOption;
  set currentOption(int val) {
    _currentOption = val;
    notifyListeners();
  }

  void onOptionsChanged(int index) {
    currentOption = index;
    notifyListeners();
  }

  void onHeaderChanged(int index) {
    currentHeader = index;
    notifyListeners();
  }

  /// Handle bottom navigation bar index change
  void onPageChanged(int index) {
    currentTab = index;
    notifyListeners();
  }

  /// Load Splash screen with persistent login logic
  void handleLoadSplash(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1800));

    /// Go to Home Page
    context.navigate(const MainScreen());
  }

  /// System overlay style
  SystemUiOverlayStyle get style => SystemUiOverlayStyle(
        /* set Status bar color in Android devices. */
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        /* set Status bar icons color in Android devices.*/
        statusBarIconBrightness:
            (Platform.isIOS ? Brightness.light : Brightness.dark),
        /* set Status bar icon color in iOS. */
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      );
}
