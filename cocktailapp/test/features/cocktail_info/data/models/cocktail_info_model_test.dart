import 'dart:convert';

import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCocktailInfoModel = CocktailInfoModel(
    id: 1,
    name: 'Test',
    thumbnail: 'Test',
    category: 'Test',
    glass: 'Test',
    instructions: 'Test',
    ingredientsAndMeasurements: {
      'Test': 'Test',
      'Test2': 'Test2',
      'Test3': 'Test3',
      'Test4': 'Test4',
      'Test5': 'Test5',
      'Test6': 'Test6',
      'Test7': 'Test7',
      'Test8': 'Test8',
      'Test9': 'Test9',
      'Test10': 'Test10',
      'Test11': 'Test11',
      'Test12': 'Test12',
      'Test13': 'Test13',
      'Test14': '',
    },
  );
  final tPartialCocktailInfoModel = PartialCocktailInfoModel(
    id: 1,
    name: 'Test',
    thumbnail: 'Test',
  );
  final tGlassModel = GlassModel(glass: 'Test Glass');
  final tCategoryModel = CategoryModel(category: 'Test Category');
  final tIngredientModel = IngredientModel(ingredient: 'Test Ingredient');

  group('CocktailInfoTemplate based models', () {
    test('should be a subclass of CocktailInfo entity', () async {
      //Assert
      expect(tCocktailInfoModel, isA<CocktailInfo>());
    });

    test('should be a subclass of PartialCocktailInfo entity', () async {
      //Assert
      expect(tPartialCocktailInfoModel, isA<PartialCocktailInfo>());
    });

    test('should be a subclass of Glass entity', () async {
      //Assert
      expect(tGlassModel, isA<Glass>());
    });

    test('should be a subclass of Category entity', () async {
      //Assert
      expect(tCategoryModel, isA<Category>());
    });

    test('should be a subclass of Ingredient entity', () async {
      //Assert
      expect(tIngredientModel, isA<Ingredient>());
    });
  });

  group('fromJson', () {
    test('should return a valid model from the JSON data for a CocktialInfoModel response', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('full_drink_info.json'));
      //Act
      final result = CocktailInfoModel.fromJson(jsonMap);
      //Assert
      expect(result, tCocktailInfoModel);
    });

    test('should return a valid model from the JSON data for a PartialCocktailInfoModel response', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('partial_drink.json'));
      //Act
      final result = PartialCocktailInfoModel.fromJson(jsonMap);
      //Assert
      expect(result, tPartialCocktailInfoModel);
    });

    test('should return a valid model from the JSON data for a GlassModel response', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('glass.json'));
      //Act
      final result = GlassModel.fromJson(jsonMap);
      //Assert
      expect(result, tGlassModel);
    });

    test('should return a valid model from the JSON data for a CategoryModel response', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('category.json'));
      //Act
      final result = CategoryModel.fromJson(jsonMap);
      //Assert
      expect(result, tCategoryModel);
    });

    test('should return a valid model from the JSON data for a IngredientModel response', () async {
      //Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('ingredient.json'));
      //Act
      final result = IngredientModel.fromJson(jsonMap);
      //Assert
      expect(result, tIngredientModel);
    });
  });
}
