import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VoucherPage extends StatefulHookConsumerWidget {
  const VoucherPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VoucherPageState();
}
class _VoucherPageState extends ConsumerState<VoucherPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Voucher"),
    );
  }
}