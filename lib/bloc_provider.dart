import 'UI/Screens/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider multiProviders({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => LoginCubit(),
      ),
    ],
    child: child,
  );
}
