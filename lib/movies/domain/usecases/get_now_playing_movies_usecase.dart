import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_sue_case.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/reprository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<MovieEntity>, NoPrameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      NoPrameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
