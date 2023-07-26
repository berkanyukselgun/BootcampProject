import 'dart:ui';
import 'package:akademi_bootcamp/core/base/state/base_state.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_model.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  const CustomBottomNavigationBar({
    this.currentIndex = 0,
    required this.onIndexChanged,
  });

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends BaseState<CustomBottomNavigationBar> {
  NavigationBarModel selectedBottomNav = bottomNavs.first;

  @override
  void initState() {
    super.initState();
    selectedBottomNav = bottomNavs[widget.currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(color: AppColors.darkGrey.withOpacity(0.15)),
          padding: EdgeInsets.symmetric(vertical: AppSizes.lowSize + AppSizes.lowSize / 2, horizontal: AppSizes.mediumSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomNavs.length, (index) {
              return InkWell(
                onTap: () {
                  if (bottomNavs[index] != selectedBottomNav) {
                    setState(() {
                      selectedBottomNav = bottomNavs[index];
                    });
                    widget.onIndexChanged(index);
                  }
                },
                child: SizedBox(
                  width: ((deviceWidth - AppSizes.highSize) / bottomNavs.length) - AppSizes.highSize,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Opacity(
                        opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                        child: Image.asset(
                          bottomNavs[index].imagePath,
                        ),
                      ),
                      line(index),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Container line(int index) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.lowSize / 2),
      height: AppSizes.lowSize / 2,
      width: bottomNavs[index] == selectedBottomNav ? AppSizes.mediumSize + AppSizes.lowSize : 0,
      decoration: BoxDecoration(color: AppColors.vanillaShake, borderRadius: AppRadius.primaryRadius),
    );
  }
}
