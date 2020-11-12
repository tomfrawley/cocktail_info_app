import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';

abstract class CocktailInfoRemoteDataSource {
  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<Categories> getCategories() {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/search.php?i={name} endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<CocktailInfo> getCocktailInfoById(int cocktailId) {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/search.php?f={letter} endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<CocktailInfoList> getCocktailsByFirstLetter(String letter) {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/search.php?s={searchTerm}  endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<CocktailInfoList> getCocktailsBySearchResults(String searchTerm) {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/filter.php?c={category} endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<PartialCocktailInfoList> getCocktailsFilteredByCategory(String category) {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/filter.php?g={glass} endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<PartialCocktailInfoList> getCocktailsFilteredByGlass(String glass) {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/filter.php?i={ingredient} endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<PartialCocktailInfoList> getCocktailsFilteredByIngredient(String ingredient) {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<Glasses> getGlasses() {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/lookup.php?iid={ingredientID} endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<IngredientInfo> getIngredientInfoById(int ingredientId) {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<Ingredients> getIngredients() {}

  /// Calls the https://www.thecocktaildb.com/api/json/v1/1/random.php endpoint.
  ///
  /// Throws a [Server Exception] for all error codes.
  Future<CocktailInfo> getRandomCocktialInfo() {}
}
