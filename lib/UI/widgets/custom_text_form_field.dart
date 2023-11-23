import '../../utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final VoidCallback? onTap;
  final bool? readonly;
  final bool? obscure;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color? filledColor;
  final Color? borderColorColor;
  final double? width;
  final int? maxLength;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final InputBorder? border;
  final TextStyle? textStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final Function(String value)? validator;
  final Function(String value)? onSaved;
  final Function(String value)? onFieldSubmitted;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.suffixWidget,
    this.onTap,
    this.readonly,
    this.obscure,
    this.labelText,
    this.hintTextStyle,
    this.labelTextStyle,
    this.filledColor,
    this.borderColorColor,
    this.width,
    this.maxLength,
    this.controller,
    this.validator,
    this.prefixWidget,
    this.maxLines,
    this.textInputType,
    this.border,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.textStyle,
    this.textAlign,
    this.contentPadding,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readonly ?? false,
      obscureText: obscure ?? false,
      validator: (value) => validator!(value!),
      onSaved: (value) => onSaved!(value!),
      onFieldSubmitted: (value) => onFieldSubmitted!(value),
      style: textStyle ??
          const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
          ),
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
        ),
        counterText: "",
        fillColor: filledColor ?? AppColors.whiteColor,
        filled: true,
        contentPadding: contentPadding ?? const EdgeInsets.all(15),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.textFromBorderColor,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.textFromBorderColor,
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.primaryColor,
              ),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.redColor,
              ),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.redColor,
              ),
            ),
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintTextStyle ??
            const TextStyle(
              fontSize: 12,
              color: AppColors.hintColor,
              fontWeight: FontWeight.w400,
            ),
        labelStyle: labelTextStyle ??
            const TextStyle(
              fontSize: 12,
              color: AppColors.hintColor,
              fontWeight: FontWeight.w400,
            ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: suffixWidget ?? const SizedBox(),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: prefixWidget ?? const SizedBox(),
        ),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 10,
          minWidth: 10,
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 10,
          minWidth: 10,
        ),
      ),
    );
  }
}
