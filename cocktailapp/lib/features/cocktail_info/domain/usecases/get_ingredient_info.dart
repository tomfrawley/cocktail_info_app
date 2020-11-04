import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetIngredientInfo {
  final CocktailInfoRepository repository;

  GetIngredientInfo(this.repository);

  Future<Either<Failure, IngredientInfo>> execute(@required String ingredient) async {
    return await repository.getIngredientInfo(ingredient);
  }
}
