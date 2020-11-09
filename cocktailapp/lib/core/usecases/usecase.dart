import 'package:cocktailapp/core/error/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {}

class Params extends Equatable {
  final String lookupTerm;
  final int id;

  Params({this.lookupTerm, this.id}) : super([lookupTerm, id]);
}
