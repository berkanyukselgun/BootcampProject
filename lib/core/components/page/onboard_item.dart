import 'package:flutter/material.dart';

import '../../constants/theme/theme_constants.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    super.key,
    this.image,
    this.question,
    this.title,
  });

  final image, question, title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(image),
      Padding(
        padding: EdgeInsets.all(AppSizes.mediumSize),
        child: Column(
          children: [
            Text(question, textAlign: TextAlign.start, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.black)),
            Divider(color: Colors.black, thickness: 1, height: AppSizes.highSize),
            Text(title, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.darkGrey), textAlign: TextAlign.start),
          ],
        ),
      ),
    ]);
  }
}
