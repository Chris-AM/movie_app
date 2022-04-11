import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Movies provider initializated');
    getNowPlayingMovieFromDB();
  }
  getNowPlayingMovieFromDB() async {
    print('Get now playing movies from db');
  }
}