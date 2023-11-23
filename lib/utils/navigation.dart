import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../UI/Screens/login/login.dart';
import '../cache/cache_helper.dart';
import '../const/const.dart';

class AppNavigation {
  static void navigateTo(context, widget) => Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => widget,
        ),
      );

  static void navigateAndFinish(context, widget) =>
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (BuildContext context) => widget,
          ), (Route<dynamic> route) {
        return false;
      });

  static void navigateAndReplace(context, widget) =>
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
        ),
      );

  static void navigateBack(context) => Navigator.of(context).pop();

  static clearCache(context) async {
    await clearUserCache();
    navigateAndFinish(context, const LoginScreen());
  }

  static void signOut(context) async {
    clearCache(context);
  }

  ///clear cache data when log out
  static Future<void> clearUserCache() async {
    await CacheHelper.clearData(
      key: 'token',
    );
  }
}
