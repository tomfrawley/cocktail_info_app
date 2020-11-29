import 'dart:convert';

import 'package:cocktailapp/core/error/exception.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_list_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/ingredient_info_model.dart';
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
  Future<Categories> getCategories() async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CocktailInfo> getCocktailInfoById(int cocktailId) async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$cocktailId',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CocktailInfoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CocktailInfoList> getCocktailsByFirstLetter(String letter) async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=$letter',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CocktailInfoListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CocktailInfoList> getCocktailsBySearchResults(String searchTerm) async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$searchTerm',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CocktailInfoListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PartialCocktailInfoList> getCocktailsFilteredByCategory(String category) async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$category',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PartialCocktailInfoListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PartialCocktailInfoList> getCocktailsFilteredByGlass(String glass) async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=$glass',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PartialCocktailInfoListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PartialCocktailInfoList> getCocktailsFilteredByIngredient(String ingredient) async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=$ingredient',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PartialCocktailInfoListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Glasses> getGlasses() async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return GlassesModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<IngredientInfo> getIngredientInfoById(int ingredientId) async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=$ingredientId',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return IngredientInfoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Ingredients> getIngredients() async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return IngredientsModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CocktailInfo> getRandomCocktialInfo() async {
    final response = await client.get(
      'https://www.thecocktaildb.com/api/json/v1/1/random.php',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return CocktailInfoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
