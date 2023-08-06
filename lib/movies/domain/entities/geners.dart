import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final String title;
  final int id;

  const Genres({required this.title, required this.id});

  @override
  List<Object?> get props => [title, id];
}
