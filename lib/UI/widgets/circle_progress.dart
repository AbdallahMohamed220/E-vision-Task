import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomCircleProgress extends StatelessWidget {
  final Color? circleColor;
  const CustomCircleProgress({Key? key, this.circleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
          circleColor ?? AppColors.primaryColor,
        ),
      ),
    );
  }
}
