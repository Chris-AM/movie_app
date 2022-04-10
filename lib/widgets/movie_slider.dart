import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Popular Movies',
              style: AppTheme.listTitle,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => const _MoviePoster(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 260,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-information'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Flexible(
            child: Text(
              'Quis ad sunt incididunt aliqua veniam quis dolor cupidatat.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
