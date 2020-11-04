import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:dartz/dartz.dart';

import '../repositories/cocktail_info_repository.dart';

class GetGlasses {
  final CocktailInfoRepository repository;

  GetGlasses(this.repository);

  Future<Either<Failure, Glasses>> execute() async {
    return await repository.getGlasses();
  }
}
