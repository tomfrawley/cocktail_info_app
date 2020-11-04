import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:meta/meta.dart';

class CocktailInfoListModel extends CocktailInfoList {
  CocktailInfoListModel({
    @required List<CocktailInfoModel> cocktailInfoList,
  }) : super(cocktailInfoList: cocktailInfoList);
}

class PartialCocktailInfoListModel extends PartialCocktailInfoList {
  PartialCocktailInfoListModel({
    List<PartialCocktailInfo> partialCocktailInfoList,
  }) : super(partialCocktailInfoList: partialCocktailInfoList);
}

class GlassesModel extends Glasses {
  GlassesModel({
    List<Glass> glasses,
  }) : super(glasses: glasses);
}

class CategoriesModel extends Categories {
  CategoriesModel({
    List<Category> categories,
  }) : super(categories: categories);
}

class IngredientsModel extends Ingredients {
  IngredientsModel({
    List<Ingredient> ingredients,
  }) : super(ingredients: ingredients);
}
