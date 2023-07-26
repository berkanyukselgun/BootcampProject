import 'package:akademi_bootcamp/core/constants/text/text_constants.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_route.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_service.dart';
import 'package:akademi_bootcamp/core/init/theme/app_theme.dart';
import 'package:akademi_bootcamp/product/initialize/application_start.dart';
import 'package:akademi_bootcamp/product/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/base/provider/internet_connection_provider.dart';

void main() async {
  await ApplicationStart.init();
  runApp(
    ChangeNotifierProvider<InternetConnectionProvider>(
      create: (_) => InternetConnectionProvider()..checkInternetConnection(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        title: TextConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppThemeDark.instance.theme,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        home: SplashView());
  }
}
