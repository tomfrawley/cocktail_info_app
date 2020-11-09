import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetCocktailsBySearchResults extends Usecase<CocktailInfoList, Params> {
  final CocktailInfoRepository repository;

  GetCocktailsBySearchResults(this.repository);

  Future<Either<Failure, CocktailInfoList>> call(Params params) async {
    return await repository.getCocktailsBySearchResults(params.lookupTerm);
  }
}
