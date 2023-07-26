import 'package:flutter/material.dart';

import '../../constants/theme/theme_constants.dart';

class EntryContent extends StatelessWidget {
  const EntryContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(AppSizes.mediumSize),
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height / 3,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.white, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.mediumSize),
        Text(description, textAlign: TextAlign.center)
      ],
    );
  }
}
