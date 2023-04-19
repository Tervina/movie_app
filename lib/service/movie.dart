class Search {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  Search({this.title, this.year, this.imdbID, this.type, this.poster});

  Search.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }
}

class Movie {
  String? title;
  String? year;
  String? released;
  String? runtime;
  String? genre;
  String? actors;
  String? plot;
  String? poster;
  String? imdbRating;
  String? imdbID;

  Movie({
    this.title,
    this.year,
    this.released,
    this.runtime,
    this.genre,
    this.actors,
    this.plot,
    this.poster,
    this.imdbRating,
    this.imdbID,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    actors = json['Actors'];
    plot = json['Plot'];
    poster = json['Poster'];
    imdbRating = json['imdbRating'];
    imdbID = json['imdbID'];
  }
}
