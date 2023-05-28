import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletPage extends StatefulHookConsumerWidget {
  const WalletPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletPageState();
}
class _WalletPageState extends ConsumerState<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Wallet"),
    );
  }
}