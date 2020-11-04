import 'package:cocktailapp/features/cocktail_info/data/models/ingredient_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tIngredientInfoModel = IngredientInfoModel(
    id: 1,
    name: 'test',
    description: 'test',
    type: 'test',
    containsAlcohol: false,
    abbreviation: 'test',
  );
  test('should be a subclass of CocktailInfo entity', () async {
    //Assert
    expect(tIngredientInfoModel, isA<IngredientInfo>());
  });
}
