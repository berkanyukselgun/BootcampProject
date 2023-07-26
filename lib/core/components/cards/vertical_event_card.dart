import 'package:akademi_bootcamp/core/base/extensions/date_time_converter.dart';
import 'package:akademi_bootcamp/core/components/image/cached_network_image_widget.card.dart';
import 'package:akademi_bootcamp/core/model/event_model.dart';
import 'package:flutter/material.dart';
import '../../constants/theme/theme_constants.dart';

// ignore: must_be_immutable
class VerticalEventCard extends StatelessWidget {
  VerticalEventCard({super.key, required this.deviceWidth, required this.eventModel, this.onTap});

  final double deviceWidth;
  void Function()? onTap;
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.lowSize) + EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            cachedNetworkImageWidget(
              posterUrl: eventModel.posterUrl,
              width: deviceWidth / 3,
              height: deviceWidth / 4,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventModel.name!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: AppColors.vanillaShake,
                          )),
                  Text(eventModel.start!.formattedDay + ', ' + eventModel.start!.formattedTime,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.vanillaShake,
                          )),
                  Text(eventModel.venue!.name!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.vanillaShake,
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
