import '../home/home.dart';
import '../../../utils/colors.dart';
import '../../../utils/navigation.dart';
import '../../../utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../widgets/circle_progress.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/space.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    LoginCubit().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();

          return Scaffold(
            body: SafeArea(
              child: Form(
                key: cubit.loginFormKey,
                child: ListView(
                  children: [
                    const VSpace(150),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const VSpace(5),
                          CustomTextFormField(
                            suffixWidget: const Icon(
                              CupertinoIcons.mail,
                            ),
                            controller: cubit.loginEmailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This Field is required';
                              }
                            },
                            onFieldSubmitted: (value) {},
                          ),
                          const VSpace(20),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const VSpace(5),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return CustomTextFormField(
                                controller: cubit.loginPasswordController,
                                autovalidateMode: AutovalidateMode.disabled,
                                obscure: cubit.obscure,
                                suffixWidget: InkWell(
                                  onTap: () {
                                    cubit.changePasswordVisibility();
                                  },
                                  child: cubit.loginPasswordIcon,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'This Field is required';
                                  }
                                },
                                onFieldSubmitted: (value) {},
                              );
                            },
                          ),
                          const VSpace(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const VSpace(32),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                AppNavigation.navigateAndFinish(
                                  context,
                                  const HomeScreen(),
                                );
                              }

                              if (state is LoginErrorState) {
                                ShowToast.showToast(
                                  message: state.error,
                                  showToastState: ShowToastState.error,
                                );
                              }
                            },
                            builder: (context, state) {
                              return Conditional.single(
                                context: context,
                                conditionBuilder: (context) =>
                                    state is! LoginLoadingState,
                                widgetBuilder: (context) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: CustomElevatedButton(
                                    label: 'Login',
                                    onPressed: () {
                                      cubit.loginUser();
                                    },
                                  ),
                                ),
                                fallbackBuilder: (context) =>
                                    const CustomCircleProgress(),
                              );
                            },
                          ),
                          const VSpace(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Login as Visitor',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VSpace(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'You Do not have an Account',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const HSpace(5),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
