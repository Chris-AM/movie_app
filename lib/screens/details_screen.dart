import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          movieTitle: movie.title,
          backDropImage: movie.fullBackDropPathImg,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              _PosterAndTitle(
                originalTitle: movie.originalTitle,
                poster: movie.fullPosterImg,
                title: movie.title,
                votes: movie.voteAverage,
              ),
              _OverView(
                description: movie.overview,
              ),
              const SizedBox(
                height: 40,
              ),
              const CastingCards()
            ],
          ),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final String movieTitle;
  final dynamic backDropImage;
  const _CustomAppBar({
    Key? key,
    required this.movieTitle,
    required this.backDropImage,
  }) : super(key: key);

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
            movieTitle,
            style: AppTheme.sliverTitle,
          ),
          padding: const EdgeInsets.only(bottom: 10),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(
            backDropImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final String title;
  final dynamic poster;
  final String originalTitle;
  final double votes;

  const _PosterAndTitle({
    Key? key,
    required this.title,
    required this.poster,
    required this.originalTitle,
    required this.votes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: NetworkImage(
                poster,
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
                  title,
                  style: AppTheme.movieTitle,
                  maxLines: 2,
                ),
                Text(
                  originalTitle,
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
                      votes.toString(),
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
  final String description;

  const _OverView({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Text(
        description,
        style: AppTheme.movieDetail,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
