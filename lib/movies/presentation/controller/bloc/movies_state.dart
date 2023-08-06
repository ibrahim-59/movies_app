// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;
  final List<MovieEntity> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.Loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.Loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.Loading,
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMessage,
    List<MovieEntity>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMessage,
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
        popularMovies,
        popularMoviesState,
        popularMessage,
        topRatedMovies,
        topRatedMessage,
        topRatedMoviesState,
      ];
}

enum RequestState { Loading, Loaded, error }
