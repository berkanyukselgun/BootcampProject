import 'package:akademi_bootcamp/product/entry/entry_view.dart';
import 'package:akademi_bootcamp/product/app-base/app_base.dart';
import 'package:akademi_bootcamp/core/constants/navigation/navigation_constants.dart';
import 'package:akademi_bootcamp/product/onboard/onboard_view.dart';
import 'package:akademi_bootcamp/product/profile/profile_view.dart';
import 'package:akademi_bootcamp/product/welcome/welcome_view.dart';
import 'package:flutter/material.dart';
import '../../../product/auth/auth_view.dart';
import '../../../product/map/mapbox_map_view.dart';
import '../../../product/profile_edit/profile_edit_view.dart';
import '../../components/page/not_found_navigation.dart';

class NavigationRoute {
  NavigationRoute._();
  static late final NavigationRoute instance = NavigationRoute._();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.AUTH:
        return navigate(AuthView());
      case NavigationConstants.MAP:
        return navigate(MapBoxView());
      case NavigationConstants.ONBOARD:
        return navigate(OnboardView());
      case NavigationConstants.APP_BASE:
        return navigate(AppBaseView());
      case NavigationConstants.WELCOME:
        return navigate(WelcomeView());
      case NavigationConstants.PROFILE:
        return navigate(ProfileView());
      case NavigationConstants.ENTRY:
        return navigate(EntryScreen());
      case NavigationConstants.PROFILE_EDIT:
        return navigate(ProfileEditView());
      default:
        MaterialPageRoute(builder: (context) => NotFoundNavigatonWidget());
    }
    return MaterialPageRoute(builder: (context) => NotFoundNavigatonWidget());
  }

  MaterialPageRoute<dynamic> navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
