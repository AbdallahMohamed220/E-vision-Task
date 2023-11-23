import 'package:bot_toast/bot_toast.dart';
import 'colors.dart';
import 'package:flutter/material.dart';

enum ShowToastState { success, warning, error }

class ShowToast {
  static void showToast({
    required String message,
    required ShowToastState showToastState,
  }) =>
      BotToast.showText(
        text: message,
        contentColor: showToastState == ShowToastState.success
            ? AppColors.primaryColor
            : showToastState == ShowToastState.error
                ? AppColors.redColor
                : AppColors.accentColor,
      );

  Color chooseToastColor(ShowToastState showToastState) {
    Color color = Colors.green;

    switch (showToastState) {
      case ShowToastState.success:
        color = AppColors.primaryColor;
        break;
      case ShowToastState.warning:
        color = Colors.amber;
        break;
      case ShowToastState.error:
        color = Colors.red;
        break;
    }
    return color;
  }
}
