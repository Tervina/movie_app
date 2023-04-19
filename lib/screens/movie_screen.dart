import 'package:flutter/material.dart';
import 'package:movie_app/service/movie.dart';

class MovieScreen extends StatelessWidget {
  final Movie myMovie;
  MovieScreen(this.myMovie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(myMovie.title!)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(myMovie.poster!),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}
