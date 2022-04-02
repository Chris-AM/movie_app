import 'package:flutter/material.dart';
import 'package:movie_app/router/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRouter(),
    );
  }
}
