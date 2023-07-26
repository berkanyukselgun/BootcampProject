import 'package:flutter/material.dart';

import '../../constants/theme/theme_constants.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  bool isVisible;
  final bool isPassword;
  void Function(String)? onChanged;
  final bool isSearch;
  CustomTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.isVisible = true,
    this.isPassword = false,
    this.isSearch = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Container(
        padding: widget.isSearch ? EdgeInsets.symmetric(horizontal: AppSizes.lowSize) : EdgeInsets.zero,
        decoration: widget.isSearch ? BoxDecoration(border: Border.all(color: AppColors.vanillaShake, width: 1), borderRadius: AppRadius.primaryRadius) : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.isSearch
                ? Padding(
                    padding: EdgeInsets.only(right: AppSizes.lowSize),
                    child: Icon(Icons.search, color: AppColors.vanillaShake),
                  )
                : SizedBox(),
            Expanded(
              child: TextField(
                onChanged: widget.onChanged,
                controller: widget.controller,
                obscureText: widget.isPassword ? obsecure : false,
                style: TextStyle(
                  color: AppColors.vanillaShake,
                ),
                focusNode: widget.focusNode,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: widget.isSearch ? InputBorder.none : null,
                  hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.darkGrey),
                  hintText: widget.hintText,
                  suffixIcon: Visibility(
                    visible: widget.isPassword,
                    child: IconButton(
                      icon: Icon(
                        obsecure ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.darkGrey,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            obsecure = !obsecure;
                          },
                        );
                      },
                    ),
                  ),
                ),
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
