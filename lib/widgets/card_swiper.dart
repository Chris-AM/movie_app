import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';

class CardSwiperScreen extends StatelessWidget {
  const CardSwiperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      color: AppTheme.primary,
    );
  }
}
