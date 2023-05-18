import 'package:flutter/material.dart';

abstract class NavigatorInterface {
  void pushNamed<T>({
    required BuildContext context,
    required String route,
    T? arguments,
  });

  void pop({
    required BuildContext context,
    String? fallbackRoute,
  });
}

class NavigatorImpl implements NavigatorInterface {
  @override
  void pushNamed<T>({
    required BuildContext context,
    required String route,
    T? arguments,
  }) {
    Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }

  @override
  void pop({required BuildContext context, String? fallbackRoute}) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    } else if (fallbackRoute != null) {
      Navigator.pushReplacementNamed(context, fallbackRoute);
    }
  }
}
