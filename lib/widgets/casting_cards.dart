import 'package:flutter/material.dart';
import 'package:movie_app/app_themes.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, int index) => const _CastCards(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _CastCards extends StatelessWidget {
  const _CastCards({Key? key}) : super(key: key);

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
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2020/10/kimetsu-no-yaiba-movie-mugen-ressha-hen-2106843.jpg?itok=RjM5j4Xi',
              ),
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          Text(
            'actor.name',
            maxLines: 2,
            style: AppTheme.footer,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
