import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/provider.dart';
import 'package:market_place/utils/constants.dart';
import 'package:market_place/utils/extensions.dart';

class QuickActions extends ConsumerWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.screenHeight(.09),
      child: PageView.builder(
        onPageChanged: (value) => ref.read(mainPageVM).onOptionsChanged(value),
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth(.06)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ["Layout", "Bell", "Ticket", "Globe", "Dollar"]
                  .map((e) => Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(context.screenWidth(.025)),
                            decoration: BoxDecoration(
                                // TODO: this is grey light
                                color: const Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(5)),
                            child: SvgPicture.asset(
                              e.toLowerCase().svg,
                              colorFilter: ColorFilter.mode(
                                kBlack.withOpacity(.55),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.screenHeight(.01),
                          ),
                          Text(
                            e,
                            style: const TextStyle(
                              fontSize: 14,
                              // TODO: this is grey
                              color: Color(0xffBEBFC3),
                            ),
                          )
                        ],
                      ))
                  .toList(),
            ),
          );
        }),
      ),
    );
  }
}
