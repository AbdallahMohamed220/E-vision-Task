import 'cache/cache_helper.dart';
import 'const/const.dart';
import 'my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  token = CacheHelper.getData(key: 'token') ?? 'null';

  runApp(MyApp(token: token));
}
