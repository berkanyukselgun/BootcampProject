import 'package:akademi_bootcamp/core/components/app_bar/custom_app_bar.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:akademi_bootcamp/product/onboard/onboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/components/page/onboard_item.dart';
import '../../core/model/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  OnboardViewModel _viewModel = OnboardViewModel();

  @override
  void initState() {
    _viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vanillaShake,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboard_data.length,
              controller: _viewModel.pageController,
              onPageChanged: (index) => _viewModel.changePage(index),
              itemBuilder: (context, index) => OnboardItem(
                image: onboard_data[index].image,
                question: onboard_data[index].title,
                title: onboard_data[index].description,
              ),
            ),
          ),
          Observer(builder: (_) {
            return CustomAppBar(
              context: context,
              left: _viewModel.leftWidget,
              onTapLeft: _viewModel.leftWidget != null ? _viewModel.goToPreviousPage : null,
              center: AppBarWidgets.TITLE,
              centerTitle: _viewModel.pageName,
              right: AppBarWidgets.NEXT,
              onTapRight: _viewModel.goToNextPage,
              leftIconColor: AppColors.black,
              rightIconColor: AppColors.black,
            );
          }),
          SizedBox(height: AppSizes.mediumSize)
        ],
      ),
    );
  }
}
