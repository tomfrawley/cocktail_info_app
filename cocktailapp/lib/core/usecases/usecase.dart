import 'package:cocktailapp/core/error/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {}

class Params extends Equatable {
  final String lookupTerm;

  Params({@required this.lookupTerm}) : super([lookupTerm]);
}
