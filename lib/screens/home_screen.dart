import 'package:movie_app/search/search_delegate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/provider/movies_provider.dart';
import 'package:movie_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Now in cinemas'),
          actions:  [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Main Movies
              CardSwiperScreen(
                movies: moviesProvider.nowPlayingMovies,
              ),
              // Movies Carrousel
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Popular Movies',
                onNextPage: () => moviesProvider.getPopularMoviesFromDB(),
              ),
            ],
          ),
        ));
  }
}
