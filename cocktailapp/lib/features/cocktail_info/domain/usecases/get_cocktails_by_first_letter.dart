import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetCocktailsByFirstLetter {
  final CocktailInfoRepository repository;

  GetCocktailsByFirstLetter(this.repository);

  Future<Either<Failure, CocktailInfoList>> execute(@required String letter) async {
    return await repository.getCocktailsByFirstLetter(letter);
  }
}
