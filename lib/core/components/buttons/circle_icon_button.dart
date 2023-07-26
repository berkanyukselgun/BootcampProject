import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleIconButton extends StatelessWidget {
  final String iconPath;
  void Function()? onTap;
  CircleIconButton({super.key, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: Image.asset(iconPath));
    // return InkWell(
    //   onTap: onTap,
    //   child: Container(
    //     height: AppSizes.highSize,
    //     width: AppSizes.highSize,
    //     child: Image.asset(iconPath),
    //     decoration: BoxDecoration(border: Border.all(color: AppColors.vanillaShake.withOpacity(0.5), width: 2), borderRadius: BorderRadius.all(Radius.circular(AppSizes.highSize / 2))),
    //   ),
    // );
  }
}
