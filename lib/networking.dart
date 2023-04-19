import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/service/movie.dart';

final apiKey = '6aab80bd';
final apiLink = 'https://www.omdbapi.com/?apikey=';
String test = 'tt1201607';

Future<Movie> getMovieById (String movieId) async{
  final url = Uri.parse('${apiLink}${apiKey}'+'&i='+movieId);
  Response response=await get(url);
  var data=jsonDecode(response.body);
  //print(data['Ratings'][0]['Source']);
  Movie movie = Movie.fromJson(data);
  return movie;
  //print(movie.title);
}

getSearchList (String searchTxt) async{
  List<Movie> movieList = [];
  final url = Uri.parse('${apiLink}${apiKey}'+'&s='+searchTxt);
  Response response=await get(url);
  var data=jsonDecode(response.body);
  //return data['Search'];
  //print(data['Ratings'][0]['Source']);
  //Movie movie = Movie.fromJson(data);
  //print(data['Search']);
  //Search search = Search.fromJson(data['Search']);
  //List<dynamic> parsedListJson = jsonDecode(data['Search'].toString());
  List<Search> itemsList = List<Search>.from(data['Search'].map<Search>((dynamic i) => Search.fromJson(i)));
  //print(itemsList);
  return itemsList;
  // while (movieList.length<data['Search'].length){
  //   Movie movie = await getMovieById(data['Search'][movieList.length]['imdbID']);
  //   movieList.add(movie);
  // }
  // for (int x in [0,1,2,3]){
  //   var t =  data['Search'][x]['imdbID'];
  //   Movie movie =  getMovieById(t);
  //   movieList.add(movie);
  // }
  //print(movieList);

}

