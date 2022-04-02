import 'package:flutter/material.dart';
import 'package:movie_app/screens/screens.dart';


class AppRouter {
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> getAppRouter() {
    Map<String, Widget Function(BuildContext)> appRouter = {};
    appRouter.addAll({
      'home': (BuildContext context) => const HomeScreen(),
      'details':(BuildContext context) => const DetailsScreen(),
    });
    return appRouter;
  }
}
