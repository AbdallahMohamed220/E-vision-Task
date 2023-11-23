import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/colors.dart';
import '../../../../cache/cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool obscure = true;
  Widget loginPasswordIcon = const Icon(
    Icons.visibility_off_outlined,
    color: AppColors.primaryColor,
  );

  void changePasswordVisibility() {
    obscure = !obscure;

    loginPasswordIcon = obscure
        ? const Icon(
            Icons.visibility_off_outlined,
            color: AppColors.primaryColor,
          )
        : const Icon(
            Icons.visibility_outlined,
            color: AppColors.primaryColor,
          );
    if (obscure) {
      emit(LoginHidePasswordState());
    } else {
      emit(LoginShowPasswordState());
    }
  }

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final String email = 'user';
  final String password = 'password';
  void loginUser() async {
    if (!loginFormKey.currentState!.validate()) return;
    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    if (loginEmailController.text == email &&
        loginPasswordController.text == password) {
      CacheHelper.saveData(key: 'token', value: 'userToken');
      loginEmailController.clear();
      loginPasswordController.clear();
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState(error: 'Invalid login Data'));
    }
  }
}
