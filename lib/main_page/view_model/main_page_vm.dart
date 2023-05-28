import 'package:flutter/widgets.dart';
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
}
