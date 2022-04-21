import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Text('build actions'),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('build leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('build suggestions: $query');
  }
}