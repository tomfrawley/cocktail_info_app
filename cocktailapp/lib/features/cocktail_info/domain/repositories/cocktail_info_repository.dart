import 'package:cocktailapp/core/error/Failures.dart';
import 'package:dartz/dartz.dart';

abstract class CocktailInfoRepository {
  Future<Either<Failure, FullDrinkInfoList>> getSearchResultsCocktailInfo(String searchTerm);
  Future<Either<Failure, FullDrinkInfoList>> getAllCocktailsStartingWithTheLetter(String letter);
  Future<Either<Failure, IngredientInfo>> getIngredientInfo(String ingredient);
  Future<Either<Failure, FullDrinkInfo>> getConcreteCocktailInfo(String drink);
  Future<Either<Failure, FullDrinkInfo>> getRandomCocktailInfo();
  Future<Either<Failure, PartialDrinkinfoList>> getDrinkListFilteredByIngredient(String ingredient);
  Future<Either<Failure, PartialDrinkInfoList>> getDrinkListFilteredByCategory(String category);
  Future<Either<Failure, PartialDrinkInfoList>> getDrinkListFilteredByGlass(String glass);
  Future<Either<Failure, CategoriesList>> getListOfCategories();
  Future<Either<Failure, GlassesList>> getListOfGlasses();
  Future<Either<Failure, IngredientsList>> getListOfIngredients();
}
