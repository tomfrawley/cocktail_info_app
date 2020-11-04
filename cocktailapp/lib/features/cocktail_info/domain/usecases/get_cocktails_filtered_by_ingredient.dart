import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetCocktailsFilteredByIngredient {
  final CocktailInfoRepository repository;

  GetCocktailsFilteredByIngredient(this.repository);

  Future<Either<Failure, PartialCocktailInfoList>> execute(@required String ingredient) async {
    return await repository.getCocktailsFilteredByIngredient(ingredient);
  }
}
