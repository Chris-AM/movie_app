import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/app_themes.dart';
import 'package:movie_app/router/app_router.dart';
import 'package:movie_app/provider/movies_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRouter(),
      theme: AppTheme.lightTheme,
    );
  }
}
