import 'package:cocktailapp/core/error/exception.dart';
import 'package:cocktailapp/core/error/failures.dart';
import 'package:cocktailapp/core/platform/network_info.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/data/models/cocktail_info_model.dart';
import 'package:cocktailapp/features/cocktail_info/data/repositories/cocktail_info_repository_impl.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements CocktailInfoRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  CocktailInfoRepositoryImpl repositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CocktailInfoRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getCategories', () {
    final tCategories = Categories(categories: [Category(category: 'test'), Category(category: 'test')]);

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCategories();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCategories()).thenAnswer((_) async => tCategories);
        //Act
        final result = await repositoryImpl.getCategories();
        //Assert
        verify(mockRemoteDataSource.getCategories());
        expect(result, Right(tCategories));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCategories()).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCategories();
        //Assert
        verify(mockRemoteDataSource.getCategories());
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });

  group('getCocktailInfoById', () {
    final int tCocktailId = 1;
    final tCocktailInfoModel = CocktailInfoModel(
      id: 1,
      name: 'Test',
      thumbnail: 'Test',
      category: 'Test',
      glass: 'Test',
      instructions: 'Test',
      ingredientsAndMeasurements: {
        'Test': 'Test',
        'Test2': 'Test2',
      },
    );
    final CocktailInfo tCocktailInfo = tCocktailInfoModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repositoryImpl.getCocktailInfoById(tCocktailId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailInfoById(tCocktailId)).thenAnswer((_) async => tCocktailInfoModel);
        //Act
        final result = await repositoryImpl.getCocktailInfoById(tCocktailId);
        //Assert
        verify(mockRemoteDataSource.getCocktailInfoById(tCocktailId));
        expect(result, Right(tCocktailInfo));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        //Arrange
        when(mockRemoteDataSource.getCocktailInfoById(tCocktailId)).thenThrow(ServerException());
        //Act
        final result = await repositoryImpl.getCocktailInfoById(tCocktailId);
        //Assert
        verify(mockRemoteDataSource.getCocktailInfoById(tCocktailId));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return NetworkFailure if device is not connected to a network', () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repositoryImpl.getCocktailInfoById(tCocktailId);
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });
}
