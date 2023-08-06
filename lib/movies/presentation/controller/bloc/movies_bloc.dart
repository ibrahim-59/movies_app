import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_sue_case.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import 'movies_events.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvents>(_getNowPlayingMovies);

    on<GetPopularMoviesEvents>(_getPopularMovies);
    on<GetTopRatedMoviesEvents>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvents event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoPrameters());

    result.fold(
        (l) => emit(
              state.copyWith(
                  nowPlayingMessage: l.message,
                  nowPlayingMoviesState: RequestState.error),
            ),
        (r) => emit(
              state.copyWith(
                  nowPlayingMovies: r,
                  nowPlayingMoviesState: RequestState.Loaded),
            ));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvents event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoPrameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            popularMessage: l.message, popularMoviesState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
            popularMovies: r, popularMoviesState: RequestState.Loaded),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvents event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoPrameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMessage: l.message,
          topRatedMoviesState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedMoviesState: RequestState.Loaded,
        ),
      ),
    );
  }
}
