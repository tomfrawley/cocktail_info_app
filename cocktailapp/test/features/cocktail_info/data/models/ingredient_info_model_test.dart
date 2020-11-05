import 'dart:convert';

import 'package:cocktailapp/features/cocktail_info/data/models/ingredient_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tIngredientInfoModel = IngredientInfoModel(
    id: 1,
    name: 'Test',
    description: 'Test',
    type: 'Test',
    containsAlcohol: false,
    abbreviation: 'Test',
  );
  test('should be a subclass of CocktailInfo entity', () async {
    //Assert
    expect(tIngredientInfoModel, isA<IngredientInfo>());
  });

  group('fromJson', () {
    test('should return a valid model from the JSON data for a IngredientInfo object', () async {
      //Arrange
      Map<String, dynamic> jsonMap = json.decode(fixture('ingredient_info.json'));
      //Act
      final result = IngredientInfoModel.fromJson(jsonMap);
      //Assert
      expect(result, tIngredientInfoModel);
    });
  });
}
