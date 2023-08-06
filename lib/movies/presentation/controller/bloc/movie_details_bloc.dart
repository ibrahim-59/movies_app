import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommindations.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecases/get_recommindation_use_case.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_state.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviDetailsUseCase, this.getRecommindationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommindationEvent>(_getMovieRecommindations);
  }

  final GetMoviDetailsUseCase getMoviDetailsUseCase;
  final GetRecommindationUseCase getRecommindationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMoviDetailsUseCase(
      MovieDetailsParameters(id: event.id),
    );
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsMessage: l.message,
        moveDetailsState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          moveDetailsState: RequestState.Loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommindations(GetMovieRecommindationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommindationUseCase(
      RecommindationParameters(event.id),
    );
    result.fold(
      (l) => emit(state.copyWith(
        movieRecommindationsMessage: l.message,
        movieRecommindationsState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          movieRecommindations: r,
          movieRecommindationsState: RequestState.Loaded,
        ),
      ),
    );
  }
}
