import 'package:flutter/material.dart';

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