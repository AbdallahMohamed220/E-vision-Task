import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final Color? butColor;
  final Color? textColor;
  final double? textFontSize;
  final double? butWidth;
  final double? butHeight;
  final double? radius;
  final FontWeight? fontWeight;
  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.butColor,
    this.textColor,
    this.butHeight,
    this.butWidth,
    this.radius,
    this.textFontSize,
    this.fontWeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0.3,
        backgroundColor: butColor ?? AppColors.primaryColor,
        minimumSize: Size(
          butWidth ?? MediaQuery.of(context).size.width,
          butHeight ?? 45,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5),
        ),
      ),
      child: Text(
        label!,
        style: TextStyle(
          fontSize: textFontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
