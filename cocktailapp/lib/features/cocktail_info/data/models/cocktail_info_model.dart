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
    Map<String, String> ingredientsAndMeasurementsMap = {
      json['strIngredient1']: json['strMeasure1'],
      json['strIngredient2']: json['strMeasure2'],
      json['strIngredient3']: json['strMeasure3'],
      json['strIngredient4']: json['strMeasure4'],
      json['strIngredient5']: json['strMeasure5'],
      json['strIngredient6']: json['strMeasure6'],
      json['strIngredient7']: json['strMeasure7'],
      json['strIngredient8']: json['strMeasure8'],
      json['strIngredient9']: json['strMeasure9'],
      json['strIngredient10']: json['strMeasure10'],
      json['strIngredient11']: json['strMeasure11'],
      json['strIngredient12']: json['strMeasure12'],
      json['strIngredient13']: json['strMeasure13'],
      json['strIngredient14']: json['strMeasure14'],
      json['strIngredient15']: json['strMeasure15'],
    };

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
