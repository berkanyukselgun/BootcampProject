import 'package:akademi_bootcamp/core/components/image/profile_photo_widget.dart';
import 'package:akademi_bootcamp/core/components/navigation_bar/custom_navigation_bar.dart';
import 'package:akademi_bootcamp/core/constants/image/image_constants.dart';
import 'package:akademi_bootcamp/core/constants/navigation/navigation_constants.dart';
import 'package:akademi_bootcamp/core/constants/text/text_constants.dart';
import 'package:akademi_bootcamp/core/constants/theme/theme_constants.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_service.dart';
import 'package:akademi_bootcamp/core/model/user_model.dart';
import 'package:akademi_bootcamp/product/groups/groups_view.dart';
import 'package:akademi_bootcamp/product/home/home_view.dart';
import 'package:akademi_bootcamp/product/map/mapbox_map_view.dart';
import 'package:akademi_bootcamp/product/profile/profile_view.dart';
import 'package:flutter/material.dart';

import '../../core/services/auth/auth_service.dart';

class AppBaseView extends StatefulWidget {
  const AppBaseView({super.key});

  @override
  State<AppBaseView> createState() => _AppBaseViewState();
}

class _AppBaseViewState extends State<AppBaseView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  logOut() async {
    await AuthService.instance.signOut();
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserModel? currentUser = AuthService.instance.currentUser;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.bgColor,
        key: _scaffoldKey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            currentUser != null
                ? DrawerHeader(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilePhotoWidget(radius: AppSizes.highSize, photoUrl: currentUser.photoUrl),
                      SizedBox(height: AppSizes.lowSize),
                      Text('~ ' + (currentUser.fullname ?? '')),
                      Text(currentUser.email ?? '', style: TextStyle(color: AppColors.grey)),
                    ],
                  ))
                : SizedBox(height: AppSizes.highSize * 2),
            AuthService.instance.uid == null
                ? ListTile(
                    leading: Icon(
                      Icons.login,
                      color: AppColors.vanillaShake,
                    ),
                    title: Text("${TextConstants.logIn}/${TextConstants.signIn}"),
                    onTap: () {
                      NavigationService.instance.navigateToPage(path: NavigationConstants.AUTH);
                    })
                : ListTile(
                    leading: Icon(Icons.logout_outlined, color: AppColors.vanillaShake),
                    tileColor: Colors.red,
                    title: Text(TextConstants.logOut, style: TextStyle(color: Colors.white)),
                    onTap: () {
                      logOut();
                    }),
            ListTile(
              contentPadding: EdgeInsets.only(top: AppSizes.highSize * 6),
              title: Image.asset(
                ImageConstants.LOGO,
                height: AppSizes.highSize * 2,
              ),
            ),
            ListTile(
              title: Text(TextConstants.copyright, textAlign: TextAlign.center),
            )
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onIndexChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: _buildCurrentView(),
    );
  }

  Widget _buildCurrentView() {
    switch (currentIndex) {
      case 0:
        return HomeView(scaffoldKey: _scaffoldKey);
      case 1:
        return MapBoxView();
      case 2:
        return GroupsView();
      case 3:
        return ProfileView();
      default:
        return Container();
    }
  }
}
