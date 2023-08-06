import 'package:movies_app/movies/domain/entities/geners.dart';

class GenresModel extends Genres {
  const GenresModel({required super.title, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        title: json['name'],
        id: json['id'],
      );
}
