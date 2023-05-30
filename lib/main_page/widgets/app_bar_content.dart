import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/models/header_model.dart';
import 'package:market_place/core/provider.dart';
import 'package:market_place/utils/extensions.dart';

class AppBarContent extends ConsumerWidget {
  const AppBarContent(this.model, {super.key});

  final HeaderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headerList = ref.watch(mainPageVM.select((it) => it.headers));
    final currentHeader =
        ref.watch(mainPageVM.select((it) => it.currentHeader));
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth(.06)),
          height: context.screenHeight(.42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(context.screenHeight(.17)),
              Text(
                model.hashTag,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Gap(context.screenHeight(.005)),
              SizedBox(
                width: context.screenWidth(.5),
                child: Text(
                  model.discount,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              Gap(context.screenHeight(.0075)),
              Text(
                model.subText,
                style: const TextStyle(fontSize: 14),
              ),
              Gap(context.screenHeight(.023)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                        vertical: context.screenHeight(.015),
                        horizontal: context.screenWidth(.04)),
                    backgroundColor: const Color(0xff2A2D40)),
                child: const Text(
                  "Check this out",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        // TODO:move to a stack
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
      ],
    );
  }
}
