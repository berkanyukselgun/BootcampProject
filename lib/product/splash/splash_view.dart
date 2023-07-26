import 'package:akademi_bootcamp/core/constants/image/image_constants.dart';
import 'package:akademi_bootcamp/product/splash/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewmodel _viewmodel = SplashViewmodel();
  @override
  void initState() {
    super.initState();
    _viewmodel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image.asset(
        ImageConstants.LOGO_WITH_NAME,
        width: 150,
      )),
    );
  }
}
