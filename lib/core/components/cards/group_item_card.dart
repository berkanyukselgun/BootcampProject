import 'package:akademi_bootcamp/core/base/extensions/date_time_converter.dart';
import 'package:akademi_bootcamp/core/components/image/cached_network_image_widget.card.dart';
import 'package:akademi_bootcamp/core/constants/image/image_constants.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:akademi_bootcamp/core/model/group_model.dart';
import 'package:akademi_bootcamp/core/model/message_model.dart';
import 'package:akademi_bootcamp/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroupItemCard extends StatelessWidget {
  void Function()? onTap;
  final GroupModel group;
  final MessageModel? lastMessage;
  final bool? inProfile;
  GroupItemCard({super.key, required this.group, this.onTap, this.lastMessage, this.inProfile = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            cachedNetworkImageWidget(
              posterUrl: group.event?.posterUrl,
              width: 80,
              height: 80,
              shape: BoxShape.circle,
            ),
            SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Text(group.event?.name ?? '', maxLines: 1, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14), overflow: TextOverflow.ellipsis)),
                    SizedBox(height: 5),
                    Flexible(child: Text("~ " + (group.event?.venue?.name ?? ''), style: Theme.of(context).textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis)),
                    SizedBox(height: 5),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        group.event!.start.toString().formattedDay + ' - ' + group.event!.start.toString().formattedTime,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.lightblue),
                      ),
                      Row(
                        children: [
                          Image.asset(ImageConstants.WHITE_FAV),
                          Text(group.favCount.toString()),
                          SizedBox(width: 40),
                          Image.asset(ImageConstants.COMMUNITY),
                          Text(group.users != null ? group.users!.length.toString() : "0"),
                        ],
                      ),
                    ]),
                    SizedBox(height: 5),
                    Flexible(
                        child: Text(
                      message(lastMessage?.sentBy?.fullname ?? '', lastMessage?.content ?? ''),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.lightGrey),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String message(String name, String message) {
    String? uid = AuthService.instance.uid;
    if (lastMessage?.sentBy?.id == uid)
      return "Sen: $message";
    else if (name.isEmpty && message.isEmpty) return "";
    return "$name: $message";
  }
}
