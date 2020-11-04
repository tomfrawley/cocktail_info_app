import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetCocktailsFilteredByGlass {
  final CocktailInfoRepository repository;

  GetCocktailsFilteredByGlass(this.repository);

  Future<Either<Failure, PartialCocktailInfoList>> execute(@required String glass) async {
    return await repository.getCocktailsFilteredByGlass(glass);
  }
}
