import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: update to movie instance
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no movie';
    return const Scaffold(
        body: CustomScrollView(
      slivers: [_CustomAppBar()],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: AppTheme.sliverColor,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            'movie.title',
            style: AppTheme.sliverTitle,
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2020/10/kimetsu-no-yaiba-movie-mugen-ressha-hen-2106843.jpg?itok=RjM5j4Xi'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
