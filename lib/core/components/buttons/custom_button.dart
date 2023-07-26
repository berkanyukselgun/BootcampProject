import 'package:flutter/material.dart';

import '../../constants/theme/theme_constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  final String title;
  bool isFilled;
  void Function()? onTap;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String? iconPath;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? marginPadding;
  CustomButton({super.key, required this.title, required this.isFilled, this.marginPadding, this.onTap, this.iconPath, this.horizontalPadding, this.verticalPadding, this.textStyle});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.marginPadding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: widget.verticalPadding ?? 0, horizontal: widget.horizontalPadding ?? 0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.iconPath != null ? Image.asset(widget.iconPath.toString()) : SizedBox(),
                Text(widget.title, style: widget.textStyle ?? Theme.of(context).textTheme.displayMedium!.copyWith(color: widget.isFilled ? AppColors.black : AppColors.vanillaShake)),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: widget.isFilled ? AppColors.vanillaShake : Colors.transparent,
              border: Border.all(width: 2, color: widget.isFilled ? Colors.transparent : AppColors.vanillaShake),
              borderRadius: AppRadius.primaryRadius),
        ),
      ),
    );
  }
}
