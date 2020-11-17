import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

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

class CocktailInfoRemoteDataSourceImpl implements CocktailInfoRemoteDataSource {
  final http.Client client;

  CocktailInfoRemoteDataSourceImpl({@required this.client});

  @override
  Future<Categories> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<CocktailInfo> getCocktailInfoById(int cocktailId) {
    // TODO: implement getCocktailInfoById
    throw UnimplementedError();
  }

  @override
  Future<CocktailInfoList> getCocktailsByFirstLetter(String letter) {
    // TODO: implement getCocktailsByFirstLetter
    throw UnimplementedError();
  }

  @override
  Future<CocktailInfoList> getCocktailsBySearchResults(String searchTerm) {
    // TODO: implement getCocktailsBySearchResults
    throw UnimplementedError();
  }

  @override
  Future<PartialCocktailInfoList> getCocktailsFilteredByCategory(String category) {
    // TODO: implement getCocktailsFilteredByCategory
    throw UnimplementedError();
  }

  @override
  Future<PartialCocktailInfoList> getCocktailsFilteredByGlass(String glass) {
    // TODO: implement getCocktailsFilteredByGlass
    throw UnimplementedError();
  }

  @override
  Future<PartialCocktailInfoList> getCocktailsFilteredByIngredient(String ingredient) {
    // TODO: implement getCocktailsFilteredByIngredient
    throw UnimplementedError();
  }

  @override
  Future<Glasses> getGlasses() {
    // TODO: implement getGlasses
    throw UnimplementedError();
  }

  @override
  Future<IngredientInfo> getIngredientInfoById(int ingredientId) {
    // TODO: implement getIngredientInfoById
    throw UnimplementedError();
  }

  @override
  Future<Ingredients> getIngredients() {
    // TODO: implement getIngredients
    throw UnimplementedError();
  }

  @override
  Future<CocktailInfo> getRandomCocktialInfo() {
    // TODO: implement getRandomCocktialInfo
    throw UnimplementedError();
  }
}
