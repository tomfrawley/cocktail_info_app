import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetCocktailsFilteredByIngredient extends Usecase<PartialCocktailInfoList, Params> {
  final CocktailInfoRepository repository;

  GetCocktailsFilteredByIngredient(this.repository);

  @override
  Future<Either<Failure, PartialCocktailInfoList>> call(Params params) async {
    return await repository.getCocktailsFilteredByIngredient(params.lookupTerm);
  }
}
