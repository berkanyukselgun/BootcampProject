import 'package:akademi_bootcamp/core/base/state/base_state.dart';
import 'package:akademi_bootcamp/core/constants/navigation/navigation_constants.dart';
import 'package:akademi_bootcamp/core/constants/text/text_constants.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_service.dart';
import 'package:akademi_bootcamp/core/services/auth/auth_service.dart';
import 'package:akademi_bootcamp/core/services/firestore/events_service.dart';
import 'package:akademi_bootcamp/product/profile/profile_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/components/cards/group_item_card.dart';
import '../../core/constants/theme/theme_constants.dart';
import '../../core/model/group_model.dart';
import '../../core/model/message_model.dart';
import '../chat/chat_view.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends BaseState<GroupsView> {
  ProfileViewModel _viewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: EventsService.instance.fetchUserGroups(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<GroupModel> groupList = snapshot.data!.docs.map((doc) => GroupModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
            List<GroupModel> filteredGroups = groupList.where((group) {
              List<SentBy> users = group.users ?? [];
              List<SentBy> myUserList = users.where((user) => user.id == AuthService.instance.currentUser?.userID).toList();
              return myUserList.isNotEmpty;
            }).toList();
            return Container(
              width: deviceWidth,
              height: deviceHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes.mediumSize,
                      top: AppSizes.highSize,
                    ),
                    child: Text(TextConstants.myGroups, style: themeData.textTheme.headlineSmall),
                  ),
                  Expanded(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: filteredGroups.length,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: slidableItem(filteredGroups, index, context),
                              ))),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(height: deviceHeight, child: Center(child: CircularProgressIndicator()));
          } else if (AuthService.instance.uid == null) {
            return SizedBox(
              height: deviceHeight,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Grupları görebilmek için"),
                  InkWell(
                      onTap: () {
                        NavigationService.instance.navigateToPage(path: NavigationConstants.AUTH);
                      },
                      child: Text("Kayıt Ol veya Giriş Yap")),
                ],
              )),
            );
          } else {
            return SizedBox(height: deviceHeight, child: Center(child: Text("Henüz bir gruba katılmadın...")));
          }
        });
  }

  Slidable slidableItem(List<GroupModel> filteredGroups, int index, BuildContext context) {
    return Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
                padding: EdgeInsets.zero,
                onPressed: (context) {
                  _viewModel.leaveGroup(context, filteredGroups[index].event);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: AppColors.orange,
                        action: SnackBarAction(
                          label: "Geri al",
                          onPressed: () {
                            _viewModel.joinGroup(context, filteredGroups[index].event);
                          },
                        ),
                        content: Text("Gruptan ayrıldınız.")),
                  );
                },
                backgroundColor: AppColors.grey,
                foregroundColor: Colors.white,
                icon: Icons.exit_to_app_rounded,
                label: 'Gruptan Ayrıl')
          ],
        ),
        child: FutureBuilder<MessageModel?>(
          future: EventsService.instance.fetchLastMessage(filteredGroups[index].event!.id.toString()),
          builder: (context, snapshot) {
            if ((snapshot.connectionState == ConnectionState.done) && (snapshot.hasData || snapshot.data == null)) {
              MessageModel? lastMessage = snapshot.data;
              return GroupItemCard(
                lastMessage: lastMessage,
                group: filteredGroups[index],
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ChatView(groupModel: filteredGroups[index]);
                    },
                  ));
                },
              );
            }
            return SizedBox.shrink();
          },
        ));
  }
}
