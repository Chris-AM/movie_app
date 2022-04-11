import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'd270788ca2d112fed4a52320da827816';
  final String _baseUrl = 'api.themoviedb.org';
  final String _nowPlayingPath = '3/movie/now_playing';
  final String _popularPath = '3/movie/popular';
  final String _language = 'en-US';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getNowPlayingMovieFromDB();
    getPopularMoviesFromDB();
  }
  getNowPlayingMovieFromDB() async {
    var url = Uri.https(
      _baseUrl,
      _nowPlayingPath,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
    );
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    nowPlayingMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMoviesFromDB() async {
    var url = Uri.https(
      _baseUrl,
      _popularPath,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
    );
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    print('first popular movies ===> ${popularMovies[0]}');
    notifyListeners();
  }
}
