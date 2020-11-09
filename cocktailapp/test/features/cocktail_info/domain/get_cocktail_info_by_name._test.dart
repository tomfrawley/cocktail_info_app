import 'package:cocktailapp/core/usecases/usecase.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_cocktail_info_by_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetCocktailInfoById usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetCocktailInfoById(mockCocktailInfoRepository);
  });

  final tCocktailId = 1;
  final tCocktailInfo = CocktailInfo(
      id: 1,
      name: 'test',
      thumbnail: 'testThumb',
      category: 'testcat',
      glass: 'testglass',
      instructions: 'testInstruc',
      ingredientsAndMeasurements: {'test ingredients': 'test measures'});

  test('should get Right(CocktailInfo) by the name from repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getCocktailInfoById(tCocktailId)).thenAnswer((realInvocation) async => Right(tCocktailInfo));
    //Act
    final result = await usecase(Params(id: tCocktailId));
    //Assert
    expect(result, Right(tCocktailInfo));
    verify(mockCocktailInfoRepository.getCocktailInfoById(tCocktailId));
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
