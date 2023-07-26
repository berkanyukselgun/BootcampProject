import 'package:akademi_bootcamp/core/base/state/base_state.dart';
import 'package:akademi_bootcamp/core/constants/navigation/navigation_constants.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_service.dart';
import 'package:akademi_bootcamp/core/services/auth/auth_service.dart';
import 'package:akademi_bootcamp/product/detail_page/detail_view.dart';
import 'package:akademi_bootcamp/product/profile/profile_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/components/app_bar/custom_app_bar.dart';
import '../../core/components/cards/group_item_card.dart';
import '../../core/components/circular_progress/event_rate_widget.dart';
import '../../core/components/image/profile_photo_widget.dart';
import '../../core/constants/image/image_constants.dart';
import '../../core/constants/theme/theme_constants.dart';
import '../../core/model/group_model.dart';
import '../../core/services/firestore/events_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  ProfileViewModel _viewModel = ProfileViewModel();
  late List<GroupModel> groupList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AuthService.instance.uid != null
            ? CustomAppBar(
                context: context,
                center: AppBarWidgets.LOGO,
                right: AppBarWidgets.EDIT,
                onTapRight: () => NavigationService.instance.navigateToPage(path: NavigationConstants.PROFILE_EDIT),
              )
            : null,
        body: AuthService.instance.uid != null
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                userHeader(),
                label(),
                events(),
              ])
            : SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Profil oluşturabilmek için"),
                      InkWell(
                          onTap: () {
                            NavigationService.instance.navigateToPage(path: NavigationConstants.AUTH);
                          },
                          child: Text("Kayıt Ol veya Giriş Yap")),
                    ],
                  ),
                ),
              ));
  }

  Widget events() {
    return Observer(builder: (_) {
      return Visibility(
        visible: !_viewModel.noEvent,
        child: Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: EventsService.instance.fetchUserGroups(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  groupList = snapshot.data!.docs.map((doc) => GroupModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
                  groupList.sort((a, b) => a.event!.start!.compareTo(b.event!.start!));

                  _viewModel.countFavEventCategories(groupList);
                  return Container(
                    width: deviceWidth,
                    height: deviceHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: groupList.isNotEmpty ? groupList.length : 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: slidableItem(groupList[index], context),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(height: deviceHeight, child: Center(child: CircularProgressIndicator()));
                } else {
                  return SizedBox(height: deviceHeight, child: Center(child: Text("Henüz bir etkinliği favoriye almadın..")));
                }
              }),
        ),
      );
    });
  }

  Slidable slidableItem(GroupModel groupModel, BuildContext context) {
    return Slidable(
        startActionPane: groupPane(groupModel),
        endActionPane: eventPane(groupModel),
        child: GroupItemCard(
            group: groupModel,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  if (groupModel.event != null) {
                    return DetailView(eventModel: groupModel.event!);
                  }
                  return SizedBox();
                },
              ));
            }));
  }

  ActionPane eventPane(GroupModel groupModel) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          padding: EdgeInsets.zero,
          onPressed: (context) async {
            if (groupModel.event != null) {
              await _viewModel.removeFav(groupModel.event!);
              setState(() {});
            }
          },
          backgroundColor: AppColors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Favorilerden Kaldır',
        ),
      ],
    );
  }

  ActionPane groupPane(GroupModel groupModel) {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
            padding: EdgeInsets.zero,
            onPressed: (context) {
              if (_viewModel.containsUser(groupModel)) {
                _viewModel.leaveGroup(context, groupModel.event);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: AppColors.orange,
                      action: SnackBarAction(
                        label: "Geri al",
                        onPressed: () {
                          _viewModel.joinGroup(context, groupModel.event);
                        },
                      ),
                      content: Text("Gruptan ayrıldınız.")),
                );
              } else {
                _viewModel.joinGroup(context, groupModel.event);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(backgroundColor: AppColors.green, content: Text("Gruba katıldınız.")),
                );
              }
            },
            backgroundColor: _viewModel.containsUser(groupModel) ? AppColors.grey : AppColors.green,
            foregroundColor: Colors.white,
            icon: _viewModel.containsUser(groupModel) ? Icons.exit_to_app_rounded : Icons.add,
            label: _viewModel.containsUser(groupModel) ? 'Gruptan Ayrıl' : 'Gruba Katıl')
      ],
    );
  }

  Padding label() {
    return Padding(
      padding: EdgeInsets.only(left: AppSizes.mediumSize, bottom: AppSizes.mediumSize),
      child: Text("Favorilerim", style: themeData.textTheme.headlineSmall),
    );
  }

  Widget userHeader() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePhotoWidget(radius: 50, photoUrl: AuthService.instance.currentUser?.photoUrl),
          SizedBox(width: AppSizes.mediumSize),
          Observer(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_viewModel.currentUser?.fullname ?? '', style: themeData.textTheme.displayMedium!.copyWith(fontSize: 16)),
                SizedBox(height: 5),
                Row(children: [Image.asset(ImageConstants.LOCATION), SizedBox(width: 5), Text(_viewModel.currentUser?.city ?? 'Şehir seçilmedi', style: themeData.textTheme.bodyMedium)]),
                SizedBox(height: 10),
                _viewModel.isLoading
                    ? SizedBox()
                    : SizedBox(
                        width: deviceWidth - AppSizes.mediumSize - 100 - 40,
                        height: 80,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: _viewModel.categoryCountMap.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            String key = _viewModel.categoryCountMap.keys.toList()[index];
                            int? count = _viewModel.categoryCountMap[key];
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: EventRateWidget(
                                number: count ?? 0,
                                size: 40,
                                eventCategory: key,
                              ),
                            );
                          },
                        ),
                      )
              ],
            );
          })
        ],
      ),
    );
  }
}
