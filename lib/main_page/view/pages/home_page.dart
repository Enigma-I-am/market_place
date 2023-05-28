import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/provider.dart';
import 'package:market_place/utils/constants.dart';
import 'package:market_place/utils/extensions.dart';

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
    final headerList = ref.watch(mainPageVM.select((value) => value.headers));
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          pinned: true,
          expandedHeight: 275,
          backgroundColor:
              _isShrink ? const Color(0xFFFBFBFB) : const Color(0xFFE6E8E7),
          title: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: context.screenWidth(),
                  height: context.screenHeight(.05),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 0,
                        ),
                        child: SvgPicture.asset('search'.svg),
                      ),
                      hintText: " Search..",
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              SvgPicture.asset('ticket'.svg),
              const Gap(10),
              SvgPicture.asset('message'.svg),
            ],
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
                    HeaderContent(headerList[index]),
              ),
            ),
          ),
          // leading: const Gap(1),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: context.screenHeight(.05),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Text("data $index"),
            ),
          ),
        ),
        SliverAppBar(
          floating: true,
          pinned: true,
          title: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                color: Colors.white,
                padding:
                    EdgeInsets.symmetric(horizontal: context.screenWidth(.06)),
                child: Column(
                  children: [
                    SizedBox(height: context.screenHeight(.03)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Sale Product",
                          style: TextStyle(
                            fontSize: context.screenWidth(.05),
                            color: const Color(0xff2A2D40),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "See more",
                          style: TextStyle(
                            fontSize: context.screenWidth(.04),
                            color: const Color(0xff4AB299),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: context.screenHeight(.9),
            child: ListView.builder(
              itemBuilder: (context, index) => Text("data $index"),
            ),
          ),
        )
        // SliverAppBar(
        //   automaticallyImplyLeading: false,
        //   elevation: 0,
        //   expandedHeight: 0,
        //   toolbarHeight: 0,
        //   collapsedHeight: 0,
        //   backgroundColor: const Color(0xFFFBFBFB),
        //   flexibleSpace: FlexibleSpaceBar(
        //     collapseMode: CollapseMode.parallax,
        //     background: ListView(
        //       padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        //       scrollDirection: Axis.horizontal,
        //       shrinkWrap: true,
        //       children: [
        //         ...List.generate(
        //           10,
        //           (index) => const Text("Menu titleeeeeee"),
        //         ),
        //       ],
        //     ),
        //   ),
        //   pinned: false,
        // ),
      ],
    );
  }
}

class HeaderContent extends ConsumerWidget {
  const HeaderContent(this.model, {super.key});

  final HeaderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headerList = ref.watch(mainPageVM.select((value) => value.headers));
    final currentHeader =
        ref.watch(mainPageVM.select((value) => value.currentHeader));
    return Stack(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth(.06)),
        height: context.screenHeight(.42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.screenHeight(.17)),
            Text(
              model.hashTag,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: context.screenHeight(.005)),
            Text(
              model.discount,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: context.screenHeight(.0075)),
            Text(
              model.subText,
              style: const TextStyle(fontSize: 14),
            ),
            SizedBox(height: context.screenHeight(.023)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                      vertical: context.screenHeight(.015),
                      horizontal: context.screenWidth(.04)),
                  backgroundColor: const Color(0xff2A2D40)),
              child: Text(
                "Check this out",
                style: TextStyle(fontSize: context.screenWidth(.035)),
              ),
            )
          ],
        ),
      ),
      Positioned(
        right: context.screenWidth(.05),
        bottom: context.screenHeight(.22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            headerList.length,
            (index) => buildDot(index: index, currentPage: currentHeader),
          ),
        ),
      ),
      Positioned(
        right: -context.screenWidth(.2),
        bottom: -context.screenHeight(.19),
        child: Image.network(
          model.imgUrl,
          fit: BoxFit.cover,
          height: context.screenHeight(.4),
        ),
      ),
    ]);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => 52;
  @override
  double get maxExtent => 52;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      // margin:const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

AnimatedContainer buildDot({int index = 0, int currentPage = 0}) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    margin: const EdgeInsets.only(right: 5),
    height: 4,
    width: currentPage == index ? 16 : 6,
    decoration: BoxDecoration(
      color: currentPage == index
          ? const Color(0xFF161828)
          : const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}

class HeaderModel {
  final String imgUrl, hashTag, discount, subText;

  HeaderModel({
    required this.imgUrl,
    required this.hashTag,
    required this.discount,
    required this.subText,
  });
}

class ProductHeader extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;

  ProductHeader({required this.minExtent, required this.maxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth(.06)),
      child: Column(
        children: [
          SizedBox(height: context.screenHeight(.03)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best Sale Product",
                style: TextStyle(
                  fontSize: context.screenWidth(.05),
                  color: const Color(0xff2A2D40),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontSize: context.screenWidth(.04),
                  color: const Color(0xff4AB299),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
