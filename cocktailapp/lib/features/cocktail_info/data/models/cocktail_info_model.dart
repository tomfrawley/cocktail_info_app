import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:meta/meta.dart';

class CocktailInfoModel extends CocktailInfo {
  CocktailInfoModel(
      {@required int id,
      @required String name,
      @required String thumbnail,
      @required String category,
      @required String glass,
      @required String instructions,
      @required Map<String, String> ingredientsAndMeasurements})
      : super(
            id: id,
            name: name,
            thumbnail: thumbnail,
            category: category,
            glass: glass,
            instructions: instructions,
            ingredientsAndMeasurements: ingredientsAndMeasurements);
}

class PartialCocktailInfoModel extends PartialCocktailInfo {
  PartialCocktailInfoModel({
    int id,
    String name,
    String thumbnail,
  }) : super(id: id, name: name, thumbnail: thumbnail);
}

class GlassModel extends Glass {
  GlassModel({
    String glass,
  }) : super(glass: glass);
}

class CategoryModel extends Category {
  CategoryModel({
    String category,
  }) : super(category: category);
}

class IngredientModel extends Ingredient {
  IngredientModel({
    String ingredient,
  }) : super(ingredient: ingredient);
}
