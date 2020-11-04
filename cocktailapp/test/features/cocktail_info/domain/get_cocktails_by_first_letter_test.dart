import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_cocktails_by_first_letter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetCocktailsByFirstLetter usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetCocktailsByFirstLetter(mockCocktailInfoRepository);
  });

  final tLetter = 't';
  final tCocktailInfo = CocktailInfo(
      id: 1,
      name: 'test',
      thumbnail: 'testThumb',
      category: 'testcat',
      glass: 'testglass',
      instructions: 'testInstruc',
      ingredientsAndMeasurements: {'test ingredients': 'test measures'});
  final tCocktailInfoList = CocktailInfoList(cocktailInfoList: [tCocktailInfo]);

  test('should get Right(CocktailInfoList) for cocktails that start with a specified letter from repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getCocktailsByFirstLetter(tLetter)).thenAnswer((realInvocation) async => Right(tCocktailInfoList));
    //Act
    final result = await usecase(Params(lookupTerm: tLetter));
    //Assert
    expect(result, Right(tCocktailInfoList));
    verify(mockCocktailInfoRepository.getCocktailsByFirstLetter(tLetter));
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
