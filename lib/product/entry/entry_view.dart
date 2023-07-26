import 'package:akademi_bootcamp/core/base/state/base_state.dart';
import 'package:akademi_bootcamp/core/components/buttons/custom_button.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:akademi_bootcamp/product/entry/entry_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/components/app_bar/custom_app_bar.dart';
import '../../core/components/page/entry_content.dart';
import '../../core/model/entry_model.dart';

//CANCEL
class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends BaseState<EntryScreen> {
  EntryViewModel _viewModel = EntryViewModel();

  @override
  void initState() {
    _viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _viewModel.pageController,
                itemCount: demo_data.length,
                onPageChanged: (index) => _viewModel.changePage(index),
                itemBuilder: (context, index) => EntryContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: _viewModel.pageController,
              count: demo_data.length,
              effect: SlideEffect(
                spacing: 20.0,
                radius: 14,
                dotWidth: 12.0,
                dotHeight: 12.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: AppColors.grey,
                activeDotColor: AppColors.white,
              ),
            ),
            Observer(builder: (_) {
              return CustomAppBar(
                context: context,
                left: _viewModel.leftWidget,
                onTapLeft: _viewModel.leftWidget != null ? _viewModel.goToPreviousPage : null,
                right: _viewModel.rightWidget,
                onTapRight: _viewModel.rightWidget != null ? _viewModel.goToNextPage : null,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  title: "Giriş Yap",
                  isFilled: false,
                  horizontalPadding: AppSizes.mediumSize,
                  verticalPadding: AppSizes.lowSize,
                ),
                CustomButton(
                  title: "Kayıt Ol",
                  isFilled: true,
                  horizontalPadding: AppSizes.mediumSize,
                  verticalPadding: AppSizes.lowSize,
                ),
              ],
            ),
            TextButton(onPressed: () {}, child: Text("Misafir olarak devam et"))
          ],
        ));
  }
}
