import 'package:cocktailapp/core/platform/network_info.dart';
import 'package:cocktailapp/features/cocktail_info/data/datasources/cocktail_info_remote_data_source.dart';
import 'package:cocktailapp/features/cocktail_info/data/repositories/cocktail_info_repository_impl.dart';
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
}
