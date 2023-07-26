import 'package:akademi_bootcamp/core/base/state/base_state.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.approveButtonTitle,
    required this.cancelButtonTitle,
    this.approveOnTap,
    this.cancelOnTap,
  }) : super(key: key);

  final String title, description, approveButtonTitle, cancelButtonTitle;
  final void Function()? approveOnTap, cancelOnTap;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends BaseState<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${widget.title}",
              style: themeData.textTheme.displaySmall!.copyWith(color: AppColors.black, fontSize: 18),
            ),
            SizedBox(height: 15),
            Text("${widget.description}", style: themeData.textTheme.bodyLarge!.copyWith(color: AppColors.black)),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: InkWell(
                highlightColor: Colors.red[200],
                onTap: widget.approveOnTap,
                child: Center(
                  child: Text(
                    widget.approveButtonTitle,
                    style: themeData.textTheme.displaySmall!.copyWith(color: AppColors.red, fontSize: 18),
                  ),
                ),
              ),
            ),
            Divider(height: 1),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                highlightColor: Colors.grey[200],
                onTap: widget.cancelOnTap,
                child: Center(
                  child: Text(
                    widget.cancelButtonTitle,
                    style: themeData.textTheme.bodyLarge!.copyWith(color: AppColors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
