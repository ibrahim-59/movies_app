import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_sue_case.dart';
import 'package:movies_app/movies/domain/entities/recommindations.dart';
import 'package:movies_app/movies/domain/reprository/base_movies_repository.dart';

class GetRecommindationUseCase
    extends BaseUseCase<List<Recommindations>, RecommindationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommindationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommindations>>> call(
      RecommindationParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommindations(parameters);
  }
}

class RecommindationParameters extends Equatable {
  final int id;

  const RecommindationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
