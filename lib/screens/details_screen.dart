import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: update to movie instance
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              const _PosterAndTitle(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const CastingCards()
            ],
          ),
        ),
      ],
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
          padding: const EdgeInsets.only(bottom: 10),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
            'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2020/10/kimetsu-no-yaiba-movie-mugen-ressha-hen-2106843.jpg?itok=RjM5j4Xi',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2020/10/kimetsu-no-yaiba-movie-mugen-ressha-hen-2106843.jpg?itok=RjM5j4Xi',
              ),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'movie.title',
                  style: AppTheme.movieTitle,
                  maxLines: 2,
                ),
                Text(
                  'movie.originalTitle',
                  style: AppTheme.movieSubtitle,
                  maxLines: 2,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.star_outline,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'movie.voteAverage',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Text(
        'Deserunt est eiusmod excepteur deserunt et fugiat id irure aliquip non officia ullamco quis. Officia ipsum aute exercitation sit officia id Lorem sunt ullamco magna id.',
        style: AppTheme.movieDetail,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
