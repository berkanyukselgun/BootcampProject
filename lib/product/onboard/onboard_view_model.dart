import 'package:akademi_bootcamp/core/constants/navigation/navigation_constants.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/components/app_bar/custom_app_bar.dart';
import '../../core/model/onboard_model.dart';
part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store {
  PageController pageController = PageController();

  @observable
  int currentPageIndex = 0;

  @observable
  String pageName = onboard_data.first.pageName;

  @observable
  AppBarWidgets? leftWidget = null;

  @action
  init() {
    pageController = PageController(initialPage: 0);
  }

  void goToNextPage() {
    if (currentPageIndex != onboard_data.length - 1) {
      currentPageIndex++;
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      NavigationService.instance.navigateToPageRemoved(path: NavigationConstants.APP_BASE);
    }
  }

  void goToPreviousPage() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @action
  changeBarInfos() {
    pageName = onboard_data[currentPageIndex].pageName;
    leftWidget = currentPageIndex == 0 ? null : AppBarWidgets.BACK;
  }

  @action
  changePage(int index) {
    currentPageIndex = index;
    changeBarInfos();
  }
}
