import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backDropPath;
  final List<int> genreIds;
  final String overView;
  final double voteAvarage;
  final String realseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAvarage,
    required this.realseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        genreIds,
        overView,
        voteAvarage,
        realseDate,
      ];
}
