import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class UserInfoEditItem extends StatelessWidget {
  const UserInfoEditItem({
    super.key,
    required this.tWidth,
    required this.label,
    required this.controller,
    required this.hintText,
  });

  final double tWidth;
  final String label;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          SizedBox(
              width: tWidth,
              child: TextField(
                controller: controller,
                style: TextStyle(color: AppColors.vanillaShake),
                decoration: InputDecoration(border: UnderlineInputBorder(), hintText: hintText),
              ))
        ],
      ),
    );
  }
}
