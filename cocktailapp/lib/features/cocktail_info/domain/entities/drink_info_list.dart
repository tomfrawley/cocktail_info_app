import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DrinkInfoListTemplate extends Equatable {
  final List<DrinkInfoTemplate> drinkInfoList;

  DrinkInfoListTemplate({
    @required this.drinkInfoList,
  }) : super([drinkInfoList]);
}

class DrinkInfoList extends DrinkInfoListTemplate {
  final List<DrinkInfo> drinkInfoList;

  DrinkInfoList({
    @required this.drinkInfoList,
  }) : super(drinkInfoList: drinkInfoList);
}

class PartialDrinkInfoList extends DrinkInfoListTemplate {
  final List<PartialDrinkInfo> partialDrinkInfoList;

  PartialDrinkInfoList({
    @required this.partialDrinkInfoList,
  }) : super(drinkInfoList: partialDrinkInfoList);
}

class GlassesList extends DrinkInfoListTemplate {
  final List<Glass> glasses;

  GlassesList({@required this.glasses}) : super(drinkInfoList: glasses);
}

class CategoriesList extends DrinkInfoListTemplate {
  final List<Category> categories;

  CategoriesList({@required this.categories}) : super(drinkInfoList: categories);
}
