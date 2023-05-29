import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListItem extends StatelessWidget {
  const AnimatedListItem({
    required this.child,
    required this.itemPosition,
    this.duration,
    this.directionsVertical = true,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final int itemPosition;
  final bool directionsVertical;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final animationDuration = duration ?? const Duration(milliseconds: 300);
    return AnimationConfiguration.staggeredList(
      position: itemPosition,
      duration: animationDuration,
      child: SlideAnimation(
        verticalOffset: directionsVertical ? 100.0 : null,
        horizontalOffset: directionsVertical ? null : 100.0,
        child: FadeInAnimation(
          curve: Curves.easeIn,
          delay: Duration(milliseconds: animationDuration.inMilliseconds ~/ 3),
          duration: animationDuration,
          child: child,
        ),
      ),
    );
  }
}