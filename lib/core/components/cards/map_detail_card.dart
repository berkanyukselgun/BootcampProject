import 'package:akademi_bootcamp/core/base/extensions/date_time_converter.dart';
import 'package:akademi_bootcamp/core/components/image/cached_network_image_widget.card.dart';
import 'package:akademi_bootcamp/core/model/group_model.dart';
import 'package:akademi_bootcamp/product/detail_page/detail_view.dart';
import 'package:flutter/material.dart';
import '../../constants/theme/theme_constants.dart';

class MapDetailCard extends StatelessWidget {
  final GroupModel group;
  final int favCount;
  const MapDetailCard({super.key, required this.group, required this.favCount});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return DetailView(eventModel: group.event!);
        },
      )),
      child: Container(
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(color: AppColors.vanillaShake.withOpacity(0.25), borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                cachedNetworkImageWidget(posterUrl: group.event?.posterUrl, height: 120, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, size: AppSizes.mediumSize, color: AppColors.red),
                      Text(favCount.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(shadows: AppShadows.textShadow)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                  Text(
                    group.event?.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium,
                    maxLines: 1,
                  ),
                  Text(group.event?.venue?.name ?? '', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 5),
                  dateWidget(group.event!.start.toString().formattedDate, context),
                  SizedBox(height: 5),
                  timeWidget(group.event!.start.toString().formattedTime + "-" + group.event!.end.toString().formattedTime, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row timeWidget(String time, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, size: AppSizes.mediumSize, color: AppColors.vanillaShake),
        SizedBox(width: AppSizes.lowSize),
        Text(time, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Row dateWidget(String date, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month, size: AppSizes.mediumSize, color: AppColors.vanillaShake),
        SizedBox(width: AppSizes.lowSize),
        Text(date, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
