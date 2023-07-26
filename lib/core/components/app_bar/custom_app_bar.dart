// ignore_for_file: must_be_immutable

import 'package:akademi_bootcamp/core/constants/image/image_constants.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final double height;
  final AppBarWidgets? left;
  final AppBarWidgets? right;
  final AppBarWidgets? center;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final String? centerTitle;
  void Function()? onTapLeft;
  void Function()? onTapRight;
  final Widget? centerWidget;

  CustomAppBar(
      {required this.context,
      this.height = kToolbarHeight,
      this.left,
      this.right,
      this.center,
      this.leftIconColor,
      this.rightIconColor,
      this.centerTitle,
      this.onTapLeft,
      this.onTapRight,
      this.centerWidget});

  @override
  Size get preferredSize => Size.fromHeight(height + AppSizes.mediumSize);
  Widget leftWidgetGenerator() {
    if (left != null) {
      switch (left) {
        case AppBarWidgets.BACK:
          return Image.asset(ImageConstants.BACK, color: leftIconColor ?? null);
        case AppBarWidgets.BACK_WITH_SHADOW:
          return Image.asset(ImageConstants.BACK_WITH_SHADOW, color: leftIconColor ?? null);
        case AppBarWidgets.MENU:
          return Icon(Icons.menu, color: AppColors.vanillaShake, size: 32);
        default:
          return SizedBox();
      }
    }
    return SizedBox();
  }

  Container profileWidget() {
    return Container(
      padding: EdgeInsets.all(AppSizes.lowSize),
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Center(child: Image.asset(ImageConstants.AUTH_IMAGE, width: preferredSize.height, height: preferredSize.height, fit: BoxFit.fitWidth)),
    );
  }

  Widget rightWidgetGenerator() {
    if (right != null) {
      switch (right) {
        case AppBarWidgets.NEXT:
          return Image.asset(ImageConstants.NEXT, color: rightIconColor ?? null);
        case AppBarWidgets.NOT_FAVOURITE:
          return Icon(Icons.favorite_outline_rounded, size: preferredSize.height / 2, color: AppColors.vanillaShake);
        case AppBarWidgets.FAVOURITE:
          return Icon(Icons.favorite_rounded, size: preferredSize.height / 2, color: AppColors.red);
        case AppBarWidgets.EDIT:
          return Icon(Icons.mode_edit_outline_rounded, size: preferredSize.height / 2 - AppSizes.lowSize, color: AppColors.vanillaShake);
        case AppBarWidgets.DONE:
          return Image.asset(ImageConstants.DONE, color: rightIconColor ?? null);
        case AppBarWidgets.NOT_NOTIFICATION:
          return Image.asset(ImageConstants.NOTIFICATION, color: rightIconColor ?? null);
        case AppBarWidgets.NOTIFICATION:
          return Image.asset(ImageConstants.NOTIFICATION, color: rightIconColor ?? null);
        default:
          return SizedBox();
      }
    }
    return SizedBox();
  }

  Widget centerWidgetGenerator() {
    if (center != null) {
      switch (center) {
        case AppBarWidgets.LOGO:
          return Image.asset(ImageConstants.LOGO_WITH_NAME, width: 102);
        case AppBarWidgets.TITLE:
          return Align(alignment: Alignment.center, child: Text(centerTitle ?? '', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.vanillaShake)));
        case AppBarWidgets.WIDGET:
          return centerWidget!;
        default:
          return SizedBox();
      }
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    double widgetWith = AppSizes.highSize + AppSizes.mediumSize;
    return SafeArea(
      child: Container(
          height: preferredSize.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: widgetWith, height: preferredSize.height, child: InkWell(onTap: onTapLeft, child: leftWidgetGenerator())),
              SizedBox(height: preferredSize.height, child: centerWidgetGenerator()),
              SizedBox(width: widgetWith, height: preferredSize.height, child: InkWell(onTap: onTapRight, child: rightWidgetGenerator())),
            ],
          )),
    );
  }
}

enum AppBarWidgets { LOGO, TITLE, NOTIFICATION, BACK, BACK_WITH_SHADOW, NEXT, MENU, FAVOURITE, NOT_FAVOURITE, NOT_NOTIFICATION, EDIT, DONE, WIDGET }
