import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info.dart';
import 'package:cocktailapp/features/cocktail_info/domain/entities/cocktail_info_list.dart';
import 'package:cocktailapp/features/cocktail_info/domain/repositories/cocktail_info_repository.dart';
import 'package:cocktailapp/features/cocktail_info/domain/usecases/get_cocktails_filtered_by_category.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCocktailInfoRepository extends Mock implements CocktailInfoRepository {}

void main() {
  GetCocktailsFilteredByCategory usecase;
  MockCocktailInfoRepository mockCocktailInfoRepository;

  setUp(() {
    mockCocktailInfoRepository = MockCocktailInfoRepository();
    usecase = GetCocktailsFilteredByCategory(mockCocktailInfoRepository);
  });

  final tCategory = 'test';
  final tCocktailInfo = PartialCocktailInfo(id: 1, name: 'test', thumbnail: 'testThumb');
  final tCocktailInfoList = PartialCocktailInfoList(partialCocktailInfoList: [tCocktailInfo]);

  test('should get Right(PartialCocktailInfoList) for a certain category from repository', () async {
    //Arrange
    when(mockCocktailInfoRepository.getCocktailsFilteredByCategory(tCategory)).thenAnswer((realInvocation) async => Right(tCocktailInfoList));
    //Act
    final result = await usecase.execute(tCategory);
    //Assert
    expect(result, Right(tCocktailInfoList));
    verify(mockCocktailInfoRepository.getCocktailsFilteredByCategory(tCategory));
    verifyNoMoreInteractions(mockCocktailInfoRepository);
  });
}
