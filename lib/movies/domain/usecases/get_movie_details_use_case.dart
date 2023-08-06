import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_sue_case.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/reprository/base_movies_repository.dart';

class GetMoviDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
