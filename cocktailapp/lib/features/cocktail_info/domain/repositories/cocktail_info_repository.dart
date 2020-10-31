import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:dartz/dartz.dart';

abstract class CocktailInfoRepository {
  Future<Either<Failure, CategoriesList>> getCategories();
  Future<Either<Failure, DrinkInfo>> getCocktailInfoByName(String drink);
  Future<Either<Failure, DrinkInfoList>> getCocktailsByFirstLetter(String letter);
  Future<Either<Failure, DrinkInfoList>> getCocktailsBySearchResults(String searchTerm);
  Future<Either<Failure, PartialDrinkInfoList>> getCocktailsFilteredByCategory(String category);
  Future<Either<Failure, PartialDrinkInfoList>> getCocktailsFilteredByGlass(String glass);
  Future<Either<Failure, PartialDrinkInfoList>> getCocktailsFilteredByIngredient(String ingredient);
  Future<Either<Failure, GlassesList>> getGlasses();
  Future<Either<Failure, IngredientInfo>> getIngredientInfo(String ingredient);
  Future<Either<Failure, IngredientInfoList>> getIngredients();
  Future<Either<Failure, DrinkInfo>> getRandomCocktailInfo();
}
