import 'dart:convert';

import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_list_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCocktailInfoModel = CocktailInfoListModel(cocktailInfoList: [
    CocktailInfoModel(
      id: 1,
      name: 'test',
      thumbnail: 'test',
      category: 'test',
      glass: 'test',
      instructions: 'test',
      ingredientsAndMeasurements: {'test': 'test'},
    )
  ]);
  final tPartialCocktailInfoModel = PartialCocktailInfoListModel(partialCocktailInfoList: [
    PartialCocktailInfoModel(
      id: 1,
      name: 'test',
      thumbnail: 'test',
    )
  ]);
  final tGlass = GlassesModel(glasses: [GlassModel(glass: 'glass')]);
  final tCategory = CategoriesModel(categories: [CategoryModel(category: 'category')]);
  final tIngredient = IngredientsModel(ingredients: [IngredientModel(ingredient: 'ingredient')]);

  final tCocktailInfoListModel = CocktailInfoListModel(cocktailInfoList: [
    CocktailInfoModel(
        id: 1,
        name: 'Test1',
        thumbnail: 'Test1',
        category: 'Test1',
        glass: 'Test1',
        instructions: 'Test1',
        ingredientsAndMeasurements: {'Test1': 'Test1', 'Test2': ''}),
    CocktailInfoModel(
        id: 2,
        name: 'Test2',
        thumbnail: 'Test2',
        category: 'Test2',
        glass: 'Test2',
        instructions: 'Test2',
        ingredientsAndMeasurements: {'Test2': 'Test2', 'Test3': ''})
  ]);

  final tPartialCocktailInfoListModel = PartialCocktailInfoListModel(partialCocktailInfoList: [
    PartialCocktailInfoModel(id: 1, name: "Test", thumbnail: "Test"),
    PartialCocktailInfoModel(id: 2, name: "Test2", thumbnail: "Test2")
  ]);

  final tGlassesModel = GlassesModel(glasses: [GlassModel(glass: 'Test1'), GlassModel(glass: 'Test2')]);
  final tCategoriesModel = CategoriesModel(categories: [CategoryModel(category: 'Test1'), CategoryModel(category: 'Test2')]);
  final tIngredientsModel = IngredientsModel(ingredients: [IngredientModel(ingredient: 'Test1'), IngredientModel(ingredient: 'Test2')]);

  group('CocktailInfoTemplate based models', () {
    test('should be a subclass of CocktailInfoList entity', () async {
      //Assert
      expect(tCocktailInfoModel, isA<CocktailInfoList>());
    });

    test('should be a subclass of PartialCocktailInfoList entity', () async {
      //Assert
      expect(tPartialCocktailInfoModel, isA<PartialCocktailInfoList>());
    });

    test('should be a subclass of Glasses entity', () async {
      //Assert
      expect(tGlass, isA<Glasses>());
    });

    test('should be a subclass of Categories entity', () async {
      //Assert
      expect(tCategory, isA<Categories>());
    });

    test('should be a subclass of Ingredients entity', () async {
      //Assert
      expect(tIngredient, isA<Ingredients>());
    });
  });

  group('fromJson', () {
    test('should return a valid model from the JSON data for a CocktailInfoListModel object', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('cocktail_info_list.json'));
      //Act
      final result = CocktailInfoListModel.fromJson(jsonMap);
      //Assert
      expect(result, tCocktailInfoListModel);
    });

    test('should return a valid model from the JSON data for a PartialCocktailInfoListModel object', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('partial_cocktail_info_list.json'));
      //Act
      final result = PartialCocktailInfoListModel.fromJson(jsonMap);
      //Assert
      expect(result, tPartialCocktailInfoListModel);
    });

    test('should return a valid model from the JSON data for a GlassesModel object', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('glasses.json'));
      //Act
      final result = GlassesModel.fromJson(jsonMap);
      //Assert
      expect(result, tGlassesModel);
    });

    test('should return a valid model from the JSON data for a CategoriesModel object', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('categories.json'));
      //Act
      final result = CategoriesModel.fromJson(jsonMap);
      //Assert
      expect(result, tCategoriesModel);
    });

    test('should return a valid model from the JSON data for a IngredientsModel object', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('ingredients.json'));
      //Act
      final result = IngredientsModel.fromJson(jsonMap);
      //Assert
      expect(result, tIngredientsModel);
    });
  });
}
