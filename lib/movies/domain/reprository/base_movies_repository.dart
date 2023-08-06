import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/entities/recommindations.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecases/get_recommindation_use_case.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommindations>>> getMovieRecommindations(
      RecommindationParameters parameters);
}
