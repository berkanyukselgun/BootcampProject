import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();
  static late final NavigationService instance = NavigationService._();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllPassedRoutes = (Route<dynamic> route) => false;
  Future<void> navigateToPage({required path, Object? object}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: object);
  }

  Future<void> navigateToPageRemoved({required path, Object? object}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(path, removeAllPassedRoutes, arguments: object);
  }
}
