import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/main_page/view/widgets/main_page_bottom_nav.dart';
import 'package:market_place/core/provider.dart';

class MainScreen extends StatefulHookConsumerWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTab = ref.watch(mainPageVM).currentTab;

    final pages = ref.watch(mainPageVM).pages.map((e) => e.page).toList();

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: const Color(0xFFFBFBFB),
      body: IndexedStack(
        index: currentTab,
        children: pages,
      ),
      bottomNavigationBar: const MainPageBottomNav(),
    );
  }
}
