import 'package:flutter/material.dart';

import '../../constants/theme/theme_constants.dart';

class EventRateWidget extends StatelessWidget {
  final double size;
  final int number;
  final String eventCategory;
  const EventRateWidget({
    super.key,
    required this.size,
    required this.number,
    required this.eventCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(width: size, height: size, child: Center(child: Text(number.toString()))),
            SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(backgroundColor: Colors.transparent, valueColor: AlwaysStoppedAnimation<Color>(AppColors.vanillaShake), value: number / 10)),
          ],
        ),
        SizedBox(height: 7),
        Text(eventCategory)
      ],
    );
  }
}
