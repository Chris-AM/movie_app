import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final movies = snapshot.data;
        return ListView.builder(
          itemCount: movies!.length,
          itemBuilder: (_, int index) => _MovieItem(
            movie: movies[index],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getResultsByQuery(query);
    return StreamBuilder(
      stream: moviesProvider.movieSuggestions,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final movies = snapshot.data;
        return ListView.builder(
          itemCount: movies!.length,
          itemBuilder: (_, int index) => _MovieItem(
            movie: movies[index],
          ),
        );
      },
    );
  }

  Widget _emptyContainer() {
    return const SizedBox(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: AppTheme.primary,
          size: 100,
        ),
      ),
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
