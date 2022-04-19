import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 180,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        final List<Cast> cast = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, int index) =>  _CastCards( cast: cast[index]),
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}

class _CastCards extends StatelessWidget {
  final Cast cast;
  const _CastCards({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: NetworkImage(
                cast.fullProfileImg,
              ),
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          Text(
            cast.name,
            maxLines: 2,
            style: AppTheme.footer,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
