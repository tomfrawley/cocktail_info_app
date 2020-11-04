import 'package:cocktailapp/core/error/Failures.dart';
import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:dartz/dartz.dart';
import '../repositories/cocktail_info_repository.dart';

class GetCategories extends Usecase<Categories, NoParams> {
  final CocktailInfoRepository repository;

  GetCategories(this.repository);

  @override
  Future<Either<Failure, Categories>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
