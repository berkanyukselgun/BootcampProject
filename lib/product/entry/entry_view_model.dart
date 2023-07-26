import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/components/app_bar/custom_app_bar.dart';
import '../../core/model/entry_model.dart';
part 'entry_view_model.g.dart';

class EntryViewModel = _EntryViewModelBase with _$EntryViewModel;

abstract class _EntryViewModelBase with Store {
  PageController pageController = PageController();

  @observable
  int currentPageIndex = 0;

  @observable
  AppBarWidgets? leftWidget = null;

  @observable
  AppBarWidgets? rightWidget = AppBarWidgets.NEXT;

  @action
  init() {
    pageController = PageController(initialPage: 0);
  }

  void goToNextPage() {
    if (currentPageIndex != demo_data.length - 1) {
      currentPageIndex++;
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
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
  changeBarIcons() {
    leftWidget = currentPageIndex == demo_data.length - 1 ? AppBarWidgets.BACK : null;
    rightWidget = currentPageIndex == 0 ? AppBarWidgets.NEXT : null;
  }

  @action
  changePage(int index) {
    currentPageIndex = index;
    changeBarIcons();
  }
}
