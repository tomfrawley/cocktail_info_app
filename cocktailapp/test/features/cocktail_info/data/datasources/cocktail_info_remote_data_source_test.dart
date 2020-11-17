import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixture_reader.dart';


class MockHttpClient extends Mock implements http.Client {0

void main() {
  CocktailInfoRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = CocktailInfoRemoteDataSourceImpl(client: mockHttpClient);
  });
}