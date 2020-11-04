import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetCocktailsFilteredByCategory {
  final CocktailInfoRepository repository;

  GetCocktailsFilteredByCategory(this.repository);

  Future<Either<Failure, PartialCocktailInfoList>> execute(@required String category) async {
    return await repository.getCocktailsFilteredByCategory(category);
  }
}
