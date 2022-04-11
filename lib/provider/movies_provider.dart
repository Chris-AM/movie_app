import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'd270788ca2d112fed4a52320da827816';
  final String _baseUrl = 'api.themoviedb.org';
  final String _nowPlayingPath = '3/movie/now_playing';
  final String _language = 'en-US';

  MoviesProvider() {
    getNowPlayingMovieFromDB();
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
    final Map<String, dynamic> decodedData = json.decode(response.body) ;
    if (response.statusCode != 200) return print('error');
    print(decodedData['dates']);
  }
}
