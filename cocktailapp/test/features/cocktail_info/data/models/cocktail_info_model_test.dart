import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tCocktailInfoModel = CocktailInfoModel(
    id: 1,
    name: 'test',
    thumbnail: 'test',
    category: 'test',
    glass: 'test',
    instructions: 'test',
    ingredientsAndMeasurements: {'test': 'test'},
  );
  final tPartialCocktailInfoModel = PartialCocktailInfoModel(
    id: 1,
    name: 'test',
    thumbnail: 'test',
  );
  final tGlass = GlassModel(glass: 'glass');
  final tCategory = CategoryModel(category: 'category');
  final tIngredient = IngredientModel(ingredient: 'ingredient');

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
      expect(tGlass, isA<Glass>());
    });

    test('should be a subclass of Category entity', () async {
      //Assert
      expect(tCategory, isA<Category>());
    });

    test('should be a subclass of Ingredient entity', () async {
      //Assert
      expect(tIngredient, isA<Ingredient>());
    });
  });
}
