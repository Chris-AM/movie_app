import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/provider/movies_provider.dart';
import 'package:movie_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.nowPlayingMovies);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Now in cinemas'),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
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
              const MovieSlider(),
            ],
          ),
        ));
  }
}
