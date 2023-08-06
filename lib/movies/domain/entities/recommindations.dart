import 'package:equatable/equatable.dart';

class Recommindations extends Equatable {
  final int id;
  final String? backDropPath;

  const Recommindations({
    required this.id,
    this.backDropPath,
  });

  @override
  List<Object?> get props => [
        id,
        backDropPath,
      ];
}
