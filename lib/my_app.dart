import 'package:bot_toast/bot_toast.dart';
import 'UI/Screens/home/home.dart';
import 'UI/Screens/login/login.dart';
import 'bloc_provider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  final String token;
  const MyApp({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return multiProviders(
      child: MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ],
        theme: ThemeData(
          visualDensity: VisualDensity.compact, // Adjust the visual density

          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        home: widget.token != "null" ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
