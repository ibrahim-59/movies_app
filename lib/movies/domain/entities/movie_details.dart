import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/geners.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final List<Genres> genres;
  final int id;
  final String overView;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetails(
      {required this.backDropPath,
      required this.genres,
      required this.id,
      required this.overView,
      required this.releaseDate,
      required this.runtime,
      required this.title,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        backDropPath,
        id,
        overView,
        releaseDate,
        runtime,
        title,
        voteAverage,
        genres
      ];
}
