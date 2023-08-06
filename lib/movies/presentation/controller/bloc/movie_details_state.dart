part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.moveDetailsState = RequestState.Loading,
    this.movieDetailsMessage = '',
    this.movieRecommindations = const [],
    this.movieRecommindationsState = RequestState.Loading,
    this.movieRecommindationsMessage = '',
  });

  final MovieDetails? movieDetails;
  final RequestState moveDetailsState;
  final String movieDetailsMessage;
  final List<Recommindations> movieRecommindations;
  final RequestState movieRecommindationsState;
  final String movieRecommindationsMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? moveDetailsState,
    String? movieDetailsMessage,
    List<Recommindations>? movieRecommindations,
    RequestState? movieRecommindationsState,
    String? movieRecommindationsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      moveDetailsState: moveDetailsState ?? this.moveDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommindations: movieRecommindations ?? this.movieRecommindations,
      movieRecommindationsState:
          movieRecommindationsState ?? this.movieRecommindationsState,
      movieRecommindationsMessage:
          movieRecommindationsMessage ?? this.movieRecommindationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        moveDetailsState,
        movieDetailsMessage,
        movieRecommindations,
        movieRecommindationsState,
        movieRecommindationsMessage
      ];
}
