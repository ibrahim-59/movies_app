import 'package:movies_app/movies/domain/entities/recommindations.dart';

class RecommindationModel extends Recommindations {
  const RecommindationModel({required super.id, super.backDropPath});

  factory RecommindationModel.fromJson(Map<String, dynamic> json) =>
      RecommindationModel(
        id: json['id'],
        backDropPath:
            json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
      );
}
