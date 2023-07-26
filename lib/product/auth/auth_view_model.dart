import 'package:akademi_bootcamp/core/constants/navigation/navigation_constants.dart';
import 'package:akademi_bootcamp/core/init/navigation/navigation_service.dart';
import 'package:akademi_bootcamp/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/constants/theme/theme_constants.dart';
part 'auth_view_model.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase with Store {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotPasswordController = TextEditingController();
  @observable
  AuthType authType = AuthType.SIGN_IN;

  @action
  changeAuthType() {
    fullnameController.clear();
    emailController.clear();
    passwordController.clear();
    if (authType == AuthType.SIGN_IN) {
      authType = AuthType.LOG_IN;
    } else {
      authType = AuthType.SIGN_IN;
    }
  }

  Future passwordReset(BuildContext? context) async {
    if (context == null) return;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotPasswordController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: AppColors.green, content: Text("Şifre yenileme linki gönderildi. Lütfen e-postanızı kontrol edin.")));
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }

    forgotPasswordController.clear();
  }

  authFunction(BuildContext context) async {
    switch (authType) {
      case AuthType.SIGN_IN:
        register(context);
        break;
      case AuthType.LOG_IN:
        login(context);
        break;
      case AuthType.GOOGLE:
        int value = await AuthService.instance.signInWithGoogle();
        if (value == 1) {
          navigateToAppBase();
        }
        break;
      case AuthType.FACEBOOK:
        // AuthService.instance.signInWithFacebook();
        break;
      case AuthType.TWITTER:
        // AuthService.instance.signInWithTwitter();
        break;
      default:
    }
  }

  register(BuildContext context) async {
    int result = await AuthService.instance.register(context, emailController.text, fullnameController.text, passwordController.text);
    if (result == 1) {
      //success
      navigateToAppBase();
    } else {
      //failed
    }
  }

  login(BuildContext context) async {
    int result = await AuthService.instance.login(context, emailController.text, passwordController.text);
    if (result == 1) {
      //success
      navigateToAppBase();
    } else {
      //failed
    }
  }
}

navigateToAppBase() {
  NavigationService.instance.navigateToPageRemoved(path: NavigationConstants.APP_BASE);
}

enum AuthType { SIGN_IN, LOG_IN, GOOGLE, FACEBOOK, TWITTER }
