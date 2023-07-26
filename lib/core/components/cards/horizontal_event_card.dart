// ignore_for_file: must_be_immutable

import 'package:akademi_bootcamp/core/base/extensions/date_time_converter.dart';
import 'package:akademi_bootcamp/core/constants/image/image_constants.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:flutter/material.dart';

import '../../model/event_model.dart';
import '../image/cached_network_image_widget.card.dart';

class HorizontalEventCard extends StatelessWidget {
  HorizontalEventCard({
    super.key,
    required this.eventModel,
    required this.deviceWidth,
    required this.deviceHeight,
    this.onTap,
  });

  final EventModel eventModel;
  final double deviceWidth;
  final double deviceHeight;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.lowSize),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: deviceWidth * 0.8,
          height: deviceHeight / 2.2,
          padding: EdgeInsets.all(AppSizes.lowSize),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.darkGrey.withOpacity(0.39),
                Colors.transparent,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              borderRadius: AppRadius.primaryRadius),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cachedNetworkImageWidget(posterUrl: eventModel.posterUrl, height: deviceHeight / 4, borderRadius: AppRadius.primaryRadius),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(eventModel.name.toString().toUpperCase(),
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16, shadows: AppShadows.textShadow)),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: AppSizes.lowSize), child: Image.asset(ImageConstants.DIVIDER)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    dateWidget(context),
                    SizedBox(height: 5),
                    timeWidget(context),
                    SizedBox(height: 5),
                    locationWidget(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row locationWidget(BuildContext context) {
    return Row(
      children: [
        Image.asset(ImageConstants.LOCATION),
        SizedBox(width: AppSizes.lowSize / 2),
        Flexible(
            child: Text(eventModel.venue!.name.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.white,
                    ))),
      ],
    );
  }

  Row timeWidget(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time_filled_rounded, color: AppColors.vanillaShake, size: 18),
        SizedBox(width: AppSizes.lowSize / 2),
        Text(eventModel.start!.formattedTime + '-' + eventModel.end!.formattedTime,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                )),
      ],
    );
  }

  Row dateWidget(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month_rounded, color: AppColors.vanillaShake, size: 18),
        SizedBox(width: AppSizes.lowSize / 2),
        Text(eventModel.start!.formattedDate,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                )),
      ],
    );
  }
}
