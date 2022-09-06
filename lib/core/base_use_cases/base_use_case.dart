import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failure.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

class NoParameters {
  NoParameters();
}
