import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      color: AppTheme.primary,
    );
  }
}
