import 'package:akademi_bootcamp/core/base/state/base_state.dart';
import 'package:akademi_bootcamp/core/components/app_bar/custom_app_bar.dart';
import 'package:akademi_bootcamp/core/components/buttons/custom_button.dart';
import 'package:akademi_bootcamp/core/components/textfield/custom_textfield.dart';
import 'package:akademi_bootcamp/core/constants/text/text_constants.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:akademi_bootcamp/core/model/event_model.dart';
import 'package:akademi_bootcamp/product/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/components/cards/vertical_event_card.dart';
import '../../core/components/cards/horizontal_event_card.dart';

class HomeView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeView({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  HomeViewModel _viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, center: AppBarWidgets.LOGO, left: AppBarWidgets.MENU, onTapLeft: () => _viewModel.openDrawer(context)),
      body: RefreshIndicator(
        color: AppColors.white,
        backgroundColor: AppColors.orange,
        onRefresh: () async {
          await _viewModel.getEventsToLocalFromApi();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.mediumSize) + EdgeInsets.only(bottom: 20),
                child: CustomTextfield(
                    hintText: TextConstants.search,
                    controller: _viewModel.searchTextEditingController,
                    onChanged: (value) => _viewModel.searchEventInList(value),
                    focusNode: _viewModel.focusNode,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    isSearch: true),
              ),
              body(),
            ],
          ),
        ),
      ),
    );
  }

  Observer body() {
    return Observer(builder: (_) {
      return _viewModel.isLoading
          ? loadingWidget()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _viewModel.isSearched ? SizedBox() : horizontalCategoriesWidget(),
                Container(width: deviceWidth, child: eventBody()),
              ],
            );
    });
  }

  SizedBox loadingWidget() {
    return SizedBox(width: deviceWidth, height: deviceHeight / 2, child: Center(child: CircularProgressIndicator()));
  }

  Widget eventBody() {
    return _viewModel.selectedIndex >= 0 && _viewModel.filteredEventList != null
        ? SingleChildScrollView(
            child: Column(
              children: [
                _viewModel.isSearched ? SizedBox() : activityInfoHeader(),
                horizontalCards(),
                Visibility(visible: _viewModel.seeAllIsActive, child: verticalCards()),
              ],
            ),
          )
        : SizedBox();
  }

  Padding activityInfoHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.mediumSize, vertical: AppSizes.lowSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${_viewModel.categoryList?[_viewModel.selectedIndex].name} ${TextConstants.activitiesOf}", style: Theme.of(context).textTheme.displayMedium),
          InkWell(
            onTap: () => _viewModel.seeAll(),
            child: Column(
              children: [
                Icon(!_viewModel.seeAllIsActive ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: AppColors.vanillaShake),
                Text(TextConstants.seeAll, style: TextStyle().copyWith(color: AppColors.vanillaShake)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget verticalCards() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: _viewModel.filteredEventList?.length ?? 0,
      itemBuilder: (context, index) {
        return VerticalEventCard(
            deviceWidth: deviceWidth, eventModel: _viewModel.filteredEventList![index], onTap: () => _viewModel.navigateToDetailPage(context, _viewModel.filteredEventList![index]));
      },
    );
  }

  Visibility horizontalCards() {
    return Visibility(
      visible: !_viewModel.seeAllIsActive,
      child: SingleChildScrollView(
          controller: _viewModel.scrollController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: _viewModel.filteredEventList != null
              ? Row(
                  children: List.generate(_viewModel.filteredEventList!.length > 5 ? 5 : _viewModel.filteredEventList!.length, (index) {
                  EventModel eventModel = _viewModel.filteredEventList![index];
                  return HorizontalEventCard(
                    onTap: () => _viewModel.navigateToDetailPage(context, _viewModel.filteredEventList![index]),
                    eventModel: eventModel,
                    deviceWidth: deviceWidth,
                    deviceHeight: deviceHeight,
                  );
                }))
              : SizedBox()),
    );
  }

  Widget horizontalCategoriesWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.mediumSize),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: _viewModel.categoryList != null
            ? Row(
                children: List.generate(_viewModel.categoryList!.length, (index) {
                  Format category = _viewModel.categoryList![index];
                  return CustomButton(
                      marginPadding: EdgeInsets.only(right: AppSizes.lowSize, bottom: AppSizes.lowSize),
                      title: category.name!,
                      isFilled: _viewModel.isSelected(index),
                      onTap: () => _viewModel.tapped(index),
                      horizontalPadding: AppSizes.lowSize,
                      verticalPadding: AppSizes.lowSize);
                }),
              )
            : SizedBox(),
      ),
    );
  }
}
