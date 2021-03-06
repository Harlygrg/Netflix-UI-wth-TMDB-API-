// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
const  String apiUrl ="https://api.themoviedb.org/3/movie/top_rated?api_"
    "key=b691875b6959a2995d4d8bbb9e13c8be&language=en-US&page=1 ";
const  apiUrl5 ='https://api.themoviedb.org/3/movie/popular?api_key=b691875b6959a2995d4d8bbb9e13c8be&language=en-US&page=1';
const   apiUrl4 ="https://api.themoviedb.org/3/movie/upcoming?api_key=b691875b6959a2995d4d8bbb9e13c8be&language=en-US&page=1";
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int ? page;
  List<Result> ? results;
  int ? totalPages;
  int ? totalResults;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool ? adult;
  String ? backdropPath;
  List<int> ? genreIds;
  int ? id;
  String ? originalLanguage;
  String ? originalTitle;
  String ? overview;
  double ? popularity;
  String ? posterPath;
  DateTime ? releaseDate;
  String ? title;
  bool ? video;
  double ? voteAverage;
  int ? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}
