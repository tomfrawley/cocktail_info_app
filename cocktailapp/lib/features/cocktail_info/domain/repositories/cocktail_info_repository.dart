import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:dartz/dartz.dart';

abstract class CocktailInfoRepository {
  Future<Either<Failure, Categories>> getCategories();
  Future<Either<Failure, CocktailInfo>> getCocktailInfoById(int cocktailId);
  Future<Either<Failure, CocktailInfoList>> getCocktailsByFirstLetter(String letter);
  Future<Either<Failure, CocktailInfoList>> getCocktailsBySearchResults(String searchTerm);
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByCategory(String category);
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByGlass(String glass);
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByIngredient(String ingredient);
  Future<Either<Failure, Glasses>> getGlasses();
  Future<Either<Failure, IngredientInfo>> getIngredientInfoById(int ingredientId);
  Future<Either<Failure, Ingredients>> getIngredients();
  Future<Either<Failure, CocktailInfo>> getRandomCocktailInfo();
}
