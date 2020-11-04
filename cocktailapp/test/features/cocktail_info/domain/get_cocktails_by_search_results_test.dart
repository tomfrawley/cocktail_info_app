import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_cocktails_by_search_results.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetCocktailsBySearchResults usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetCocktailsBySearchResults(mockCocktailInfoRepository);
  });

  final tSearchTerm = 'test';
  final tCocktailInfo = CocktailInfo(
      id: 1,
      name: 'test',
      thumbnail: 'testThumb',
      category: 'testcat',
      glass: 'testglass',
      instructions: 'testInstruc',
      ingredientsAndMeasurements: {'test ingredients': 'test measures'});
  final tCocktailInfoList = CocktailInfoList(cocktailInfoList: [tCocktailInfo]);

  test('should get Right(CocktailInfoList) by the search results from repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getCocktailsBySearchResults(tSearchTerm)).thenAnswer((realInvocation) async => Right(tCocktailInfoList));
    //Act
    final result = await usecase(Params(lookupTerm: tSearchTerm));
    //Assert
    expect(result, Right(tCocktailInfoList));
    verify(mockCocktailInfoRepository.getCocktailsBySearchResults(tSearchTerm));
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
