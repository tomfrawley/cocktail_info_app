import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:dartz/dartz.dart';

abstract class CocktailInfoRepository {
  Future<Either<Failure, DrinkInfoList>> getSearchResultsCocktailInfoList(String searchTerm);
  Future<Either<Failure, DrinkInfoList>> getAllCocktailsStartingWithTheLetter(String letter);
  Future<Either<Failure, IngredientInfo>> getIngredientInfo(String ingredient);
  Future<Either<Failure, DrinkInfo>> getConcreteCocktailInfo(String drink);
  Future<Either<Failure, DrinkInfo>> getRandomCocktailInfo();
  Future<Either<Failure, PartialDrinkInfoList>> getDrinkListFilteredByIngredient(String ingredient);
  Future<Either<Failure, PartialDrinkInfoList>> getDrinkListFilteredByCategory(String category);
  Future<Either<Failure, PartialDrinkInfoList>> getDrinkListFilteredByGlass(String glass);
  Future<Either<Failure, CategoriesList>> getListOfCategories();
  Future<Either<Failure, GlassesList>> getListOfGlasses();
  Future<Either<Failure, IngredientInfoList>> getListOfIngredients();
}
