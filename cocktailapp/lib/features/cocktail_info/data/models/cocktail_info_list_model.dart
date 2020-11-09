import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:meta/meta.dart';

class CocktailInfoListModel extends CocktailInfoList {
  CocktailInfoListModel({
    @required List<CocktailInfoModel> cocktailInfoList,
  }) : super(cocktailInfoList: cocktailInfoList);

  factory CocktailInfoListModel.fromJson(Map<String, dynamic> jsonListMap) {
    List<CocktailInfoModel> jsonStringList = (jsonListMap['drinks'] as List).map((cocktailJson) {
      return CocktailInfoModel.fromJson(cocktailJson);
    }).toList();
    return CocktailInfoListModel(cocktailInfoList: jsonStringList);
  }
}

class PartialCocktailInfoListModel extends PartialCocktailInfoList {
  PartialCocktailInfoListModel({
    List<PartialCocktailInfo> partialCocktailInfoList,
  }) : super(partialCocktailInfoList: partialCocktailInfoList);

  factory PartialCocktailInfoListModel.fromJson(Map<String, dynamic> jsonListMap) {
    List<PartialCocktailInfoModel> jsonStringList = (jsonListMap['drinks'] as List).map((cocktailJson) {
      return PartialCocktailInfoModel.fromJson(cocktailJson);
    }).toList();
    return PartialCocktailInfoListModel(partialCocktailInfoList: jsonStringList);
  }
}

class GlassesModel extends Glasses {
  GlassesModel({
    List<GlassModel> glasses,
  }) : super(glasses: glasses);

  factory GlassesModel.fromJson(Map<String, dynamic> jsonListMap) {
    List<GlassModel> jsonStringList = (jsonListMap['drinks'] as List).map((cocktailJson) {
      return GlassModel.fromJson(cocktailJson);
    }).toList();
    return GlassesModel(glasses: jsonStringList);
  }
}

class CategoriesModel extends Categories {
  CategoriesModel({
    List<CategoryModel> categories,
  }) : super(categories: categories);

  factory CategoriesModel.fromJson(Map<String, dynamic> jsonListMap) {
    List<CategoryModel> jsonStringList = (jsonListMap['drinks'] as List).map((cocktailJson) {
      return CategoryModel.fromJson(cocktailJson);
    }).toList();
    return CategoriesModel(categories: jsonStringList);
  }
}

class IngredientsModel extends Ingredients {
  IngredientsModel({
    List<IngredientModel> ingredients,
  }) : super(ingredients: ingredients);

  factory IngredientsModel.fromJson(Map<String, dynamic> jsonListMap) {
    List<IngredientModel> jsonStringList = (jsonListMap['drinks'] as List).map((cocktailJson) {
      return IngredientModel.fromJson(cocktailJson);
    }).toList();
    return IngredientsModel(ingredients: jsonStringList);
  }
}
