import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/provider.dart';
import 'package:market_place/utils/extensions.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    () {
      ref.read(mainPageVM).handleLoadSplash(context);
    }.withPostFrameCallback();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
