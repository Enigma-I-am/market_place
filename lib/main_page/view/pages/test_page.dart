import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:market_place/core/navigator.dart';
import 'package:market_place/utils/extensions.dart';
import 'package:market_place/widgets/touchable_opacity.dart';

class ResturantProfile extends ConsumerStatefulWidget {
  const ResturantProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResturantProfileState();
}

class _ResturantProfileState extends ConsumerState<ResturantProfile> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
  int tabIndex = 0;

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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              expandedHeight: 275,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: const Text(
                        "Kilimanjaro",
                      )
                    ,
                background: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1567620832903-9fc6debc209f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 20,
                        // width: 3,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                              19.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              leading: TouchableOpacity(
                onTap: () => context.pop(),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9FB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30.0,
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(11),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9FB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30.0,
                      ),
                    ),
                  ),
                  child: SvgPicture.asset(
                    'bin'.svg,
                    // height: 30,
                    // width: 20,
                  ),
                ),
              ],
            ),
            if (_isShrink) ...[
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  Container(
                    height: 52,
                    child: ListView(
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        ...List.generate(
                          10,
                          (index) => index == 0
                              ? Text("Menu title")
                              : Text("Menu titleeeeeee"),
                        ),
                      ],
                    ),
                  ),
                ),
                pinned: true,
              ),
            ],
          ];
        },
        body: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!_isShrink) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            "Kilimanjaro",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'bin'.svg,
                          ),
                        ],
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "The very best at satisfying you!",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color(0xFF696A6B)),
                      ),
                    ),
                    const Gap(20),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            'bin'.svg,
                            color: const Color(0xFFB1B2B4),
                          ),
                          const Text(
                            ' 3.5',
                            style: TextStyle(),
                          ),
                          const Gap(10),
                          SvgPicture.asset(
                            'bin'.svg,
                            color: const Color(0xFF919294),
                          ),
                          const Text(
                            ' 2.1km',
                            style: TextStyle(),
                          ),
                          const Gap(10),
                          SvgPicture.asset('bin'.svg),
                          const Text(
                            ' ~15 min',
                            style: TextStyle(),
                          ),
                          const Gap(10),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.1),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              'bin'.svg,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const Gap(20),
                  Expanded(
                    child: Container(
                      child: ListView(
                        padding: const EdgeInsets.only(
                          top: 0.0,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              "Menu group",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                // color: const Color(0xFF696A6B),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              "The very best at satisfying you!",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color(
                                  0xFF696A6B,
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
                          ...List.generate(
                            3,
                            (index) => const MenuItem(),
                          ),
                          const Gap(30),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              "Menu group",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                // color: const Color(0xFF696A6B),
                              ),
                            ),
                          ),
                          const Gap(20),
                          ...List.generate(
                            3,
                            (index) => const MenuItem(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              _isShrink
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: const EdgeInsets.all(8.0),
                        child: const ViewOrderCard(),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  bool selected(int _) => tabIndex == _;
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

class ViewOrderCard extends ConsumerWidget {
  const ViewOrderCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  100,
                ),
              ),
            ),
            child: Text(
              "1",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Gap(10),
          Text(
            "View more",
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            "₦2300",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends HookConsumerWidget {
  const MenuItem({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 4,
                top: 4,
              ),
              height: 100,
              width: 5,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA024),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meal title',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color(0xFF38383A),
                  ),
                ),
                const Gap(2),
                SizedBox(
                  width: context.screenWidth(.5),
                  child: Text(
                    'Brief description of the meal, contents and compostions.....',
                    maxLines: 2,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF38383A),
                    ),
                  ),
                ),
                const Gap(2),
                Text(
                  '₦2300',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xFFFFA024),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80",
                  width: context.screenWidth(.35),
                  height: context.screenHeight(.11),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // const Gap(5),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Divider(height: 1, color: Colors.grey),
        )
      ],
    );
  }
}
