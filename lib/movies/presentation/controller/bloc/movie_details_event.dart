part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMovieRecommindationEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommindationEvent(this.id);

  @override
  List<Object?> get props => [id];
}
