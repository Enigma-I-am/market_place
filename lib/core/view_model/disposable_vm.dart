import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/navigator.dart';

typedef Reader<T> = T Function(ProviderListenable<T> provider);

abstract class DisposableViewModel extends DisposableChangeNotifier {
  Reader read;

  // LoaderVM get loader => read(loaderVM);

  DisposableViewModel(this.read) {
    if (_mounted == false) {
      log('$this is not mounted');
    }
  }
}

abstract class DisposableChangeNotifier extends ChangeNotifier {
  bool _mounted = true;
  bool get mounted => _mounted && navigator.state?.mounted == true;

  @override
  void notifyListeners() {
    if (mounted) super.notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}