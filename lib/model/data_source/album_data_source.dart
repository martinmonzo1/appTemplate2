import 'dart:convert';
import 'package:http/http.dart' as http;
import '../class/album.dart';


abstract class AlbumDataSource {
  Future<Album> getAlbum(http.Client client);
}

class ApiAlbumDataSource implements AlbumDataSource {

  @override
  Future<Album> getAlbum(http.Client client) async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class ApiAlbumDataSourceAux implements AlbumDataSource {

  @override
  Future<Album> getAlbum(http.Client client) async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}