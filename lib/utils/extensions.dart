import 'package:flutter/material.dart';
import 'package:market_place/main_page/widgets/animated_list.dart';
import 'package:market_place/utils/constants.dart';
import 'package:dartx/dartx.dart';

extension StringEXT on String {
  String get svg => 'assets/images/svg/$this.svg';
  String get png => 'assets/images/png/$this.png';
  String get jpg => 'assets/images/png/$this.jpg';
}

extension FunctionExt on Function {
  void withPostFrameCallback() =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        this();
      });

  void withCallback({VoidCallback? callback}) async {
    await this();
    callback?.call();
  }

  String get asString => toString().split(' ').last.replaceAll(":.", "->");
}

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

extension AnimatedList on Iterable<Widget> {
  Iterable<Widget> animate() {
    return mapIndexed(
      (index, child) => AnimatedListItem(
        itemPosition: index,
        child: child,
      ),
    ).toList();
  }

  List<Widget> animatedList() => animate().toList();
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
