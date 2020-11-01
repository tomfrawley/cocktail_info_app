import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info_list.dart';
import 'package:dartz/dartz.dart';

import '../repositories/cocktail_info_repository.dart';

class GetCategories {
  final CocktailInfoRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, Categories>> execute() async {
    return await repository.getCategories();
  }
}
