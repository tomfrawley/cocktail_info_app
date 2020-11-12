import 'package:cocktailapp/core/error/exception.dart';
import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/platform/network_info.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/ingredient_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:dartz/dartz.dart';

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
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCocktailInfoById(cocktailId));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsByFirstLetter(String letter) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCocktailsByFirstLetter(letter));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, CocktailInfoList>> getCocktailsBySearchResults(String searchTerm) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCocktailsBySearchResults(searchTerm));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByCategory(String category) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCocktailsFilteredByCategory(category));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByGlass(String glass) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCocktailsFilteredByGlass(glass));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, PartialCocktailInfoList>> getCocktailsFilteredByIngredient(String ingredient) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getCocktailsFilteredByIngredient(ingredient));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
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
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getRandomCocktialInfo());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
