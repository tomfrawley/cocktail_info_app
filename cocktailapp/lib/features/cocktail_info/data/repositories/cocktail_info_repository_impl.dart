import 'package:cocktailapp/core/error/exception.dart';
import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/platform/network_info.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

typedef Future<PartialCocktailInfoList> _PartialListChooser();
typedef Future<CocktailInfoList> _CocktailInfoListChooser();
typedef Future<CocktailInfo> _CocktailInfoChooser();

class CocktailInfoRepositoryImpl implements CocktailInfoRepository {
  final CocktailInfoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CocktailInfoRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, Categories>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCategories());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CocktailInfo>> getCocktailInfoById(int cocktailId) async {
    return await _getCocktailInfo(() {
      return remoteDataSource.getCocktailInfoById(cocktailId);
    });
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsByFirstLetter(String letter) async {
    return await _getCocktailInfoList(() {
      return remoteDataSource.getCocktailsByFirstLetter(letter);
    });
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsBySearchResults(String searchTerm) async {
    return await _getCocktailInfoList(() {
      return remoteDataSource.getCocktailsBySearchResults(searchTerm);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByCategory(String category) async {
    return await _getPartialCocktailInfoList(() {
      return remoteDataSource.getCocktailsFilteredByCategory(category);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByGlass(String glass) async {
    return await _getPartialCocktailInfoList(() {
      return remoteDataSource.getCocktailsFilteredByGlass(glass);
    });
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByIngredient(String ingredient) async {
    return await _getPartialCocktailInfoList(() {
      return remoteDataSource.getCocktailsFilteredByIngredient(ingredient);
    });
  }

  @override
  Future<Either<Failure, Glasses>> getGlasses() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getGlasses());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, IngredientInfo>> getIngredientInfoById(int ingredientId) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getIngredientInfoById(ingredientId));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Ingredients>> getIngredients() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getIngredients());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CocktailInfo>> getRandomCocktailInfo() async {
    return await _getCocktailInfo(() {
      return remoteDataSource.getRandomCocktialInfo();
    });
  }

  Future<Either<Failure, CocktailInfo>> _getCocktailInfo(_CocktailInfoChooser typeChooser) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await typeChooser());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, CocktailInfoList>> _getCocktailInfoList(_CocktailInfoListChooser typeChooser) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await typeChooser());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, PartialCocktailInfoList>> _getPartialCocktailInfoList(_PartialListChooser typeChooser) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await typeChooser());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
