import 'package:app_template/model/class/album.dart';
import 'package:app_template/model/data_source/album_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'album_data_source_test.mocks.dart';
import 'album_data_source_test.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('getAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();
      final AlbumDataSource albumDataSource = ApiAlbumDataSource();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/')))
        .thenAnswer((_) async => http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await albumDataSource.getAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final AlbumDataSource albumDataSource = ApiAlbumDataSource();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(albumDataSource.getAlbum(client), throwsException);
    });
  });
}