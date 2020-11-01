import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/drink_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetCocktailInfoByName {
  final CocktailInfoRepository repository;

  GetCocktailInfoByName(this.repository);

  Future<Either<Failure, CocktailInfo>> execute(@required String drink) async {
    return await repository.getCocktailInfoByName(drink);
  }
}
