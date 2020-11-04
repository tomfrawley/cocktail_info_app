import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:dartz/dartz.dart';

import '../repositories/cocktail_info_repository.dart';

class GetGlasses extends Usecase<Glasses, NoParams> {
  final CocktailInfoRepository repository;

  GetGlasses(this.repository);

  @override
  Future<Either<Failure, Glasses>> call(NoParams params) async {
    return await repository.getGlasses();
  }
}
