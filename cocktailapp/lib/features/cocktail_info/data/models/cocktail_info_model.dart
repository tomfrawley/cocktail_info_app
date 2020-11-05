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

  factory CocktailInfoModel.fromJson(Map<String, dynamic> json) {
    Map<String, String> ingredientsAndMeasurementsMap = {};

    for (int i = 1; i < 16; i++) {
      if (json['strIngredient$i'] != null) {
        ingredientsAndMeasurementsMap[json['strIngredient$i']] = (json['strMeasure$i'] != null) ? json['strMeasure$i'] : '';
      }
    }

    return CocktailInfoModel(
      id: int.parse(json['idDrink']),
      name: json['strDrink'],
      thumbnail: json['strDrinkThumb'],
      category: json['strCategory'],
      glass: json['strGlass'],
      instructions: json['strInstructions'],
      ingredientsAndMeasurements: ingredientsAndMeasurementsMap,
    );
  }
}

class PartialCocktailInfoModel extends PartialCocktailInfo {
  PartialCocktailInfoModel({
    int id,
    String name,
    String thumbnail,
  }) : super(id: id, name: name, thumbnail: thumbnail);

  factory PartialCocktailInfoModel.fromJson(Map<String, dynamic> json) {
    return PartialCocktailInfoModel(
      id: int.parse(json['idDrink']),
      name: json['strDrink'],
      thumbnail: json['strDrinkThumb'],
    );
  }
}

class GlassModel extends Glass {
  GlassModel({
    String glass,
  }) : super(glass: glass);

  factory GlassModel.fromJson(Map<String, dynamic> json) {
    return GlassModel(glass: json['strGlass']);
  }
}

class CategoryModel extends Category {
  CategoryModel({
    String category,
  }) : super(category: category);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(category: json['strCategory']);
  }
}

class IngredientModel extends Ingredient {
  IngredientModel({
    String ingredient,
  }) : super(ingredient: ingredient);

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(ingredient: json['strIngredient1']);
  }
}
