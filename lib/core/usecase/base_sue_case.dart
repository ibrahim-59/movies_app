import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUseCase<type, Parameters> {
  Future<Either<Failure, type>> call(Parameters parameters);
}

class NoPrameters extends Equatable {
  const NoPrameters();

  @override
  List<Object?> get props => [];
}
