import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_list_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:flutter_test/flutter_test.dart';

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
}
