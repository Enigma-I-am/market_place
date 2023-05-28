import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/provider.dart';
import 'package:market_place/utils/constants.dart';
import 'package:market_place/utils/extensions.dart';
import 'package:market_place/widgets/touchable_opacity.dart';

class MainPageBottomNav extends HookConsumerWidget {
  const MainPageBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab =
        ref.watch(mainPageVM.select((value) => value.currentTab));
    final pages = ref.watch(mainPageVM.select((value) => value.pages));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: const Color(0xffF1F4F2),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24, top: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < pages.length; i++)
                SizedBox(
                  width: 75,
                  child: Tooltip(
                    message: pages[i].name,
                    child: TouchableOpacity(
                      onTap: () => ref.read(mainPageVM).onPageChanged(i),
                      child: Builder(
                        builder: (BuildContext context) {
                          final item = pages[i];
                          final selected = i == currentTab;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [

                                    SvgPicture.asset(
                                      item.img.svg,
                                      height: 20,
                                      colorFilter: getTabColor(selected),
                                    ),
                                  // if (item == pages.index(3))
                                ],
                              ),
                              const Gap(6.5),
                              Text(
                                item.name,
                                style: TextStyle(
                                  color:
                                      selected ? kEdenGreen : kGreyQuaternary,
                                  fontSize: 11,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  ColorFilter getTabColor(bool isSelected) => ColorFilter.mode(
        isSelected ? kEdenGreen : kGreyQuaternary,
        BlendMode.srcIn,
      );
}

class MainPageTab {
  const MainPageTab({
    required this.page,
    required this.img,
    required this.name,
  });

  final Widget page;
  final String img, name;
}
