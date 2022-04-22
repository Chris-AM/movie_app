import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'd270788ca2d112fed4a52320da827816';
  final String _baseUrl = 'api.themoviedb.org';
  final String _nowPlayingPath = '3/movie/now_playing';
  final String _popularPath = '3/movie/popular';
  final String _searchPath = '3/search/movie';
  final String _language = 'en-US';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCasts = {};

  int _popularPage = 0;

  MoviesProvider() {
    getNowPlayingMovieFromDB();
    getPopularMoviesFromDB();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page',
      },
    );
    final response = await http.get(url);
    return response.body;
  }

  getNowPlayingMovieFromDB() async {
    final jsonData = await _getJsonData(_nowPlayingPath);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    nowPlayingMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMoviesFromDB() async {
    //increasing popular pages in infinite carrousel
    _popularPage++;
    final jsonData = await _getJsonData(_popularPath, _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCasts.containsKey(movieId)) return movieCasts[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creaditsResponse = CreditsResponse.fromJson(jsonData);
    movieCasts[movieId] = creaditsResponse.cast;
    return creaditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(
      _baseUrl,
      _searchPath,
      {'api_key': _apiKey, 'language': _language, 'query': query},
    );

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}
