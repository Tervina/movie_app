import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/service/movie.dart';

final apiKey = '6aab80bd';
final apiLink = 'https://www.omdbapi.com/?apikey=';
String test = 'tt1201607';

Future<Movie> getMovieById(String movieId) async {
  final url = Uri.parse('${apiLink}${apiKey}' + '&i=' + movieId);
  Response response = await get(url);
  var data = jsonDecode(response.body);
  Movie movie = Movie.fromJson(data);
  return movie;
}

Future<List<Movie>> getSearchList(String searchTxt) async {
  List<Movie> movieList = [];

  final url = Uri.parse('${apiLink}${apiKey}' + '&s=' + searchTxt);
  Response response = await get(url);
  var data = jsonDecode(response.body);

  List<Search> itemsList = List<Search>.from(
      data['Search'].map<Search>((dynamic i) => Search.fromJson(i)));

  for (Search item in itemsList) {
    Movie mv = await getMovieById(item.imdbID!);
    movieList.add(mv);
  }
  print('done');
  return movieList;
}
