import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backDropPath,
    required super.genreIds,
    required super.overView,
    required super.voteAvarage,
    required super.realseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backDropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overView: json['overview'],
        voteAvarage: json['vote_average'].toDouble(),
        realseDate: json['release_date'],
      );
}
