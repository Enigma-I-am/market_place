import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/navigator.dart';
import 'package:market_place/core/provider.dart';
import 'package:market_place/main_page/detail_screen.dart';
import 'package:market_place/main_page/widgets/app_bar_content.dart';
import 'package:market_place/main_page/widgets/product_item_card.dart';
import 'package:market_place/main_page/widgets/quick_actions.dart';
import 'package:market_place/main_page/widgets/search_field.dart';
import 'package:market_place/utils/extensions.dart';
import 'package:market_place/widgets/touchable_opacity.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  final PageController _pageController = PageController();
  Timer? _timer;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  void _stopAutoScroll() {
    _pageController.dispose();
    _timer?.cancel();
  }

  void _setupPageViewAutoScroll() {
    int _pageCount = ref.read(mainPageVM).headers.length;
    int _currentPage = ref.read(mainPageVM).currentHeader;
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_currentPage == _pageCount - 1) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _currentPage = 0;
      } else {
        final nextPage = (_currentPage + 1);
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _currentPage = nextPage;
      }
    });
  }

  @override
  void initState() {
    () {
      _setupPageViewAutoScroll();
    }.withPostFrameCallback();
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final headerList = ref.watch(mainPageVM.select((it) => it.headers));
    final currentOptions =
        ref.watch(mainPageVM.select((it) => it.currentOption));
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          pinned: true,
          expandedHeight: 300,
          backgroundColor:
              _isShrink ? const Color(0xFFFBFBFB) : const Color(0xFFE6E8E7),
          title: Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: SearchField(),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(
                    'shopping-bag'.svg,
                    width: 20,
                    height: 25,
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(
                    'message'.svg,
                    width: 20,
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: SizedBox(
              width: double.maxFinite,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) =>
                    ref.read(mainPageVM).onHeaderChanged(value),
                itemCount: headerList.length,
                itemBuilder: (context, index) =>
                    AppBarContent(headerList[index]),
              ),
            ),
          ),
          // leading: const Gap(1),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: const Color(0xFFFBFBFB),
            height: context.screenHeight(.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const QuickActions(),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) =>
                        buildDot(index: index, currentPage: currentOptions),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: context.screenHeight(.08),
            maxHeight: context.screenHeight(.08),
            child: const Column(
              children: [
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Sale Product",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff2A2D40),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "See more",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4AB299),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth(.06)),
          sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: context.screenHeight(.3),
                mainAxisSpacing: context.screenWidth(.04),
                crossAxisSpacing: context.screenWidth(.04),
              ),
              itemCount: 20,
              itemBuilder: (
                context,
                index,
              ) {
                final double randomRating =
                    Random().nextDouble() * (5.0 - 4.5) + 4.5;
                final int randomSales = Random().nextInt(5000 - 3000) + 3000;
                final int randomPrice = Random().nextInt(50 - 10) + 10;

                return TouchableOpacity(
                  onTap: () => context.navigate(const ProductDetails()),
                  child: ProductItemCard(
                    randomRating: randomRating,
                    randomSales: randomSales,
                    index: index,
                    randomPrice: randomPrice,
                  ),
                );
              }),
        )
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final Widget child;
  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth(.06)),
      color: const Color(0xFFFBFBFB),
      child: SizedBox.expand(child: child),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}
