import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/reprository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommindation_use_case.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_bloc.dart';

import '../../movies/domain/usecases/get_movie_details_use_case.dart';
import '../../movies/presentation/controller/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// movies Bloc
    sl.registerFactory(
      () => MoviesBloc(
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerFactory(
      () => MovieDetailsBloc(
        sl(),
        sl(),
      ),
    );

    /// use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommindationUseCase(sl()));

    /// movies repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
