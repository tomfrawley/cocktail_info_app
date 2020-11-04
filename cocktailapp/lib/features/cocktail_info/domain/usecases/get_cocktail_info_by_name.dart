import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

class GetCocktailInfoByName extends Usecase<CocktailInfo, Params> {
  final CocktailInfoRepository repository;

  GetCocktailInfoByName(this.repository);

  Future<Either<Failure, CocktailInfo>> call(Params params) async {
    return await repository.getCocktailInfoByName(params.lookupTerm);
  }
}
