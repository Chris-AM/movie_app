import 'package:flutter/material.dart';
import 'package:movie_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            children: const [
              // Main Movies
              CardSwiperScreen(),
              // Movies Carrousel
              MovieSlider(),
            ],
          ),
        ));
  }
}
